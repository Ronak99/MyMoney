part of '../parser.dart';

class PDFExtractionResult {
  final List<Transaction> transactions;
  final String extractedText;
  final int pageCount;
  final double processingTime;

  PDFExtractionResult({
    required this.transactions,
    required this.extractedText,
    required this.pageCount,
    required this.processingTime,
  });
}

enum TransactionType {
  upiOut,
  nft,
  other,
}

class FiStatementParser implements BankStatementParser {
  final int currentYear = DateTime.now().year;

  @override
  List<Transaction> parse(String rawText) {
    List<Transaction> transactions = [];
    final List<String> lines = rawText.split('\n');

    String? currentDate;
    int i = 0;

    while (i < lines.length) {
      final String line = lines[i].trim();

      // Check if this line is a date (format: "01 Jul", "02 Jul", etc.)
      if (_isDateLine(line)) {
        currentDate = line;
        i++;
        continue;
      }

      // If we have a current date and this looks like a transaction line
      if (currentDate != null && _isTransactionLine(line)) {
        // Parse single-line transaction
        final Transaction? transaction = _parseSingleLineTransaction(
            line: line,
            dateString: currentDate
        );

        if (transaction != null) {
          transactions.add(transaction);
        } else {
          // Try multi-line transaction parsing
          final result = _parseMultiLineTransaction(
            startingAt: i,
            lines: lines,
            dateString: currentDate,
          );

          if (result.transaction != null) {
            transactions.add(result.transaction!);
            i = result.nextIndex - 1; // Will be incremented at end of loop
          }
        }
      }

      i++;
    }

    // Sort transactions by date
    transactions.sort((a, b) => a.date.compareTo(b.date));
    return transactions;
  }

  bool _isDateLine(String line) {
    // Pattern: "01 Jul", "02 Jul", etc.
    final RegExp datePattern = RegExp(r'^\d{2}\s+[A-Za-z]{3}$');
    return datePattern.hasMatch(line);
  }

  bool _isTransactionLine(String line) {
    // Check if line contains transaction patterns
    return line.contains("UPIOUT/") ||
        line.contains("NFT/") ||
        (line.contains("/") && _containsAmountPattern(line));
  }

  bool _containsAmountPattern(String line) {
    // Look for amount patterns like "1,21,496.00" or "159.40"
    final RegExp amountPattern = RegExp(r'\d{1,3}(,\d{2,3})*\.\d{2}');
    return amountPattern.hasMatch(line);
  }

  Transaction? _parseSingleLineTransaction({
    required String line,
    required String dateString
  }) {
    // Try to extract amount and balance from the end of the line
    final List<String> components = line
        .split(RegExp(r'\s+'))
        .where((component) => component.isNotEmpty)
        .toList();

    if (components.length < 3) return null;

    // Last two components should be amount and balance
    final String balanceStr = components.last;
    final String amountStr = components[components.length - 2];

    final double? amount = _parseAmount(amountStr);
    final double? balance = _parseAmount(balanceStr);
    final DateTime? date = _parseDate(dateString);

    if (amount == null || balance == null || date == null) {
      return null;
    }

    // Extract transaction details (everything except last two components)
    final String transactionDetails = components
        .take(components.length - 2)
        .join(" ");

    final String receiverUPI = _extractReceiverUPI(transactionDetails);
    final TransactionType transactionType = _determineTransactionType(transactionDetails);

    return Transaction(
      name: receiverUPI,
      amount: amount,
      date: date,
      description: transactionType.name,
    );
  }

  ({Transaction? transaction, int nextIndex}) _parseMultiLineTransaction({
    required int startingAt,
    required List<String> lines,
    required String dateString,
  }) {
    String combinedLine = "";
    int i = startingAt;
    bool foundAmountBalance = false;

    // Combine lines until we find amount and balance
    while (i < lines.length && !foundAmountBalance) {
      final String line = lines[i].trim();

      // Stop if we hit another date or empty line
      if (line.isEmpty || _isDateLine(line)) {
        break;
      }

      combinedLine += " $line";

      // Check if this combined line now has amount and balance
      final List<String> components = combinedLine
          .split(RegExp(r'\s+'))
          .where((component) => component.isNotEmpty)
          .toList();

      if (components.length >= 2) {
        final List<String> lastTwo = components.takeLast(2).toList();
        if (_parseAmount(lastTwo[0]) != null && _parseAmount(lastTwo[1]) != null) {
          foundAmountBalance = true;
        }
      }

      i++;
    }

    final Transaction? transaction = _parseSingleLineTransaction(
      line: combinedLine.trim(),
      dateString: dateString,
    );

    return (transaction: transaction, nextIndex: i);
  }

  double? _parseAmount(String amountString) {
    // Clean the string - remove currency symbols and spaces
    String cleanString = amountString
        .replaceAll("₹", "")
        .replaceAll(" ", "")
        .replaceAll(",", "")
        .trim();

    // Handle negative amounts in parentheses
    bool isNegative = cleanString.startsWith("(") && cleanString.endsWith(")");
    if (isNegative) {
      cleanString = cleanString.substring(1, cleanString.length - 1);
    }

    // Convert to double
    final double? decimal = double.tryParse(cleanString);
    if (decimal != null) {
      return isNegative ? -decimal : decimal;
    }

    return null;
  }

  DateTime? _parseDate(String dateString) {
    // Format: "01 Jul" - we need to add the year
    final String dateWithYear = "$dateString $currentYear";

    try {
      // Parse using month name mapping
      final List<String> parts = dateWithYear.split(' ');
      if (parts.length == 3) {
        final int day = int.parse(parts[0]);
        final String monthStr = parts[1].toLowerCase();
        final int year = int.parse(parts[2]);

        final Map<String, int> months = {
          'jan': 1, 'feb': 2, 'mar': 3, 'apr': 4, 'may': 5, 'jun': 6,
          'jul': 7, 'aug': 8, 'sep': 9, 'oct': 10, 'nov': 11, 'dec': 12,
        };

        final int? month = months[monthStr];
        if (month != null) {
          return DateTime(year, month, day);
        }
      }
    } catch (e) {
      print('Error parsing date: $dateString');
    }

    return null;
  }

  String _extractReceiverUPI(String transactionDetails) {
    // Extract UPI ID patterns
    final List<String> upiPatterns = [
      r'[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',  // Standard UPI format
      r'[a-zA-Z0-9._-]+@[a-zA-Z]+',  // Simplified UPI format
    ];

    for (String pattern in upiPatterns) {
      final RegExp regex = RegExp(pattern);
      final Match? match = regex.firstMatch(transactionDetails);
      if (match != null) {
        return match.group(0)!;
      }
    }

    // If no UPI pattern found, try to extract from transaction ID
    if (transactionDetails.contains("UPIOUT/")) {
      final List<String> components = transactionDetails.split("/");
      if (components.length >= 3) {
        // Usually the UPI is in the 3rd component
        final String upiComponent = components[2];
        if (upiComponent.contains("@")) {
          return upiComponent;
        }
      }
    }

    return "Unknown";
  }

  TransactionType _determineTransactionType(String transactionDetails) {
    if (transactionDetails.contains("UPIOUT")) {
      return TransactionType.upiOut;
    } else if (transactionDetails.contains("NFT")) {
      return TransactionType.nft;
    } else {
      return TransactionType.other;
    }
  }
}

// Extension to get last N elements from a list
extension ListExtensions<T> on List<T> {
  List<T> takeLast(int count) {
    if (count >= length) return this;
    return sublist(length - count);
  }
}