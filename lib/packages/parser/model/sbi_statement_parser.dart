part of '../parser.dart';

class SbiStatementParser extends Parser {
  @override
  List<Transaction> parse(String text) {
    List<Transaction> transactions = [];
    List<String> lines = text.split('\n');

    String? currentDate;

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].trim();

      // Skip empty lines and header information
      if (line.isEmpty || _isHeaderLine(line)) {
        continue;
      }

      // Check if this line contains a date
      if (_isDateLine(line)) {
        currentDate = _extractDateString(line);
        continue;
      }

      // If we have a current date and this looks like transaction data
      if (currentDate != null && _isTransactionLine(line)) {
        // Try parsing single-line transaction first
        Transaction? transaction = _parseSingleLineTransaction(
          line: line,
          dateString: currentDate,
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
    }

    return transactions;
  }

  static bool _isHeaderLine(String line) {
    return line.contains('Date') && line.contains('Credit') && line.contains('Debit') ||
        line.contains('Account') ||
        line.contains('Balance as on') ||
        line.contains('State Bank') ||
        line.contains('CKYC') ||
        line.contains('Drawing Power') ||
        line.contains('computer generated') ||
        line.contains('do not share') ||
        line.startsWith('**') ||
        line.contains('462002095') ||
        line.contains('Michael Scott') ||
        line.contains('INR') ||
        line.contains('IFS Code') ||
        line.contains('Savings A/c') ||
        line == '-';
  }

  static bool _isDateLine(String line) {
    return RegExp(r'\d{2}\s+(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)\s+\d{4}\d{2}\.\d{2}(AM|PM)').hasMatch(line);
  }

  static String? _extractDateString(String line) {
    RegExp dateRegex = RegExp(r'(\d{2}\s+(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)\s+\d{4}\d{2}\.\d{2}(AM|PM))');
    Match? match = dateRegex.firstMatch(line);
    return match?.group(1);
  }

  static bool _isTransactionLine(String line) {
    // Check if line contains transaction indicators or amounts
    return line.contains('TRANSFER') ||
        line.contains('ACH') ||
        line.contains('UPI') ||
        RegExp(r'\b\d+\.\d{2}\b').hasMatch(line) ||
        line.contains('-');
  }

  static ({Transaction? transaction, int nextIndex}) _parseMultiLineTransaction({
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

      combinedLine += "^^$line";

      // Check if this combined line now has amount and balance
      final List<String> components = combinedLine
          .split("^^")
          .where((component) => component.isNotEmpty)
          .toList();

      if (components.length >= 4) {
        final List<String> lastTwo = components.skip(components.length - 2).toList();
        if (_parseAmount(lastTwo[0]) != null && _parseAmount(lastTwo[1]) != null) {
          foundAmountBalance = true;
        }
      }

      i++;
    }

    final Transaction? transaction = _parseSingleLineTransaction(
      line: combinedLine.trim().replaceAll("^^", " "),
      dateString: dateString,
    );

    return (transaction: transaction, nextIndex: i);
  }

  static Transaction? _parseSingleLineTransaction({
    required String line,
    required String dateString,
  }) {
    // Try to extract amount and balance from the end of the line
    final List<String> components = line
        .split(RegExp(r'\s+'))
        .where((component) => component.isNotEmpty)
        .toList();

    if (components.length < 3) return null;

    // Last component should be balance
    final String balanceStr = components.last;
    final double? balance = _parseAmount(balanceStr);

    if (balance == null) return null;

    // Look for amount in the line - could be credit or debit
    double? amount;
    String transactionDetails = "";

    // Try to find amount by looking for numeric values that aren't the balance
    for (int i = 0; i < components.length - 1; i++) {
      double? possibleAmount = _parseAmount(components[i]);
      if (possibleAmount != null && possibleAmount != balance) {
        amount = possibleAmount;
        // Everything else is transaction details
        transactionDetails = components
            .where((comp) => comp != components[i] && comp != balanceStr)
            .join(" ");
        break;
      }
    }

    // If no separate amount found, try to determine from transaction type and context
    if (amount == null) {
      transactionDetails = components.take(components.length - 1).join(" ");
      // For now, we'll skip transactions without clear amounts
      return null;
    }

    final DateTime? date = _parseDate(dateString);
    if (date == null) return null;

    // Determine if this is a debit or credit based on transaction details
    final TransactionType transactionType = _determineTransactionType(transactionDetails);

    // Make debits negative
    if (_isDebitTransaction(transactionDetails)) {
      amount = amount.abs();
    }

    final String receiverName = _extractReceiverName(transactionDetails) ?? _extractCompanyName(transactionDetails) ?? "Unknown";

    return Transaction(
      notes: receiverName + transactionDetails,
      amount: amount,
      date: date,
      transactionType: transactionType,
    );
  }

  static double? _parseAmount(String amountStr) {
    // Remove any non-numeric characters except decimal point
    String cleanAmount = amountStr.replaceAll(RegExp(r'[^\d.]'), '');
    if (cleanAmount.isEmpty) return null;

    try {
      return double.parse(cleanAmount);
    } catch (e) {
      return null;
    }
  }

  static DateTime? _parseDate(String dateTimeStr) {
    try {
      // Parse format like "20 JUL 202505.38PM"
      RegExp regex = RegExp(r'(\d{2})\s+([A-Z]{3})\s+(\d{4})(\d{2})\.(\d{2})(AM|PM)');
      Match? match = regex.firstMatch(dateTimeStr);

      if (match == null) return null;

      int day = int.parse(match.group(1)!);
      String monthStr = match.group(2)!;
      int year = int.parse(match.group(3)!);
      int hour = int.parse(match.group(4)!);
      int minute = int.parse(match.group(5)!);
      String period = match.group(6)!;

      // Convert month string to number
      Map<String, int> months = {
        'JAN': 1, 'FEB': 2, 'MAR': 3, 'APR': 4, 'MAY': 5, 'JUN': 6,
        'JUL': 7, 'AUG': 8, 'SEP': 9, 'OCT': 10, 'NOV': 11, 'DEC': 12
      };

      int month = months[monthStr] ?? 1;

      // Convert to 24-hour format
      if (period == 'PM' && hour != 12) {
        hour += 12;
      } else if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      return DateTime(year, month, day, hour, minute);
    } catch (e) {
      return null;
    }
  }

  static TransactionType _determineTransactionType(String transactionDetails) {
    if (transactionDetails.contains('UPI')) {
      return TransactionType.expense;
    } else if (transactionDetails.contains('ACHCr')) {
      return TransactionType.expense;
    } else if (transactionDetails.contains('ACHDr')) {
      return TransactionType.expense;
    } else if (transactionDetails.contains('TRANSFER')) {
      return TransactionType.transfer;
    } else {
    }
      return TransactionType.none;
  }

  static bool _isDebitTransaction(String transactionDetails) {
    return transactionDetails.contains('TRANSFER TO') ||
        transactionDetails.contains('ACHDr') ||
        transactionDetails.contains('UPI/DR/');
  }

  static String? _extractReceiverName(String transactionDetails) {
    // Extract from UPI transactions
    RegExp upiRegex = RegExp(r'UPI/[CD]R/\d+/([^/]+)');
    Match? upiMatch = upiRegex.firstMatch(transactionDetails);
    if (upiMatch != null) {
      return upiMatch.group(1)!.trim();
    }

    return null;
  }

  static String? _extractCompanyName(String transactionDetails) {
    // Extract from ACH transactions
    if (transactionDetails.contains('ACH')) {
      RegExp achRegex = RegExp(r'ACH[CD]r\s+[A-Z0-9]+\s*(.+?)(?:\s+FINAL|\s+DIVID|\s+LIM)?');
      Match? achMatch = achRegex.firstMatch(transactionDetails);
      if (achMatch != null) {
        String companyName = achMatch.group(1)!.trim();
        // Clean up common suffixes
        companyName = companyName.replaceAll(RegExp(r'\s+(LIMITED|LTD|FINAL\d*|DIVID\d*)$'), '');
        return companyName;
      }
    }

    // For other transactions, try to extract meaningful names
    List<String> words = transactionDetails.split(RegExp(r'\s+'));
    for (String word in words) {
      if (word.length > 3 &&
          !RegExp(r'^\d+\.?\d*$').hasMatch(word) &&
          !word.contains('TRANSFER') &&
          !word.contains('TO') &&
          !word.contains('FROM')) {
        return word;
      }
    }

    return null;
  }
}