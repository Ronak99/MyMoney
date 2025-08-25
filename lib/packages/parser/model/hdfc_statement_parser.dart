import 'package:my_money/extensions/list.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/packages/parser/parser.dart';

class HdfcStatementParser extends BankStatementParser {
  @override
  List<Transaction> parse(String text) {
    List<Transaction> transactions = [];
    List<String> lines = text.split('\n');

    String? currentDate;
    int transactionId = 1;

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].trim();

      // Skip empty lines and header information
      if (line.isEmpty || _isHeaderLine(line)) {
        continue;
      }

      // Check if this line contains a date
      if (_isDateLine(line)) {
        currentDate = _extractDateFromLine(line);
        continue;
      }

      // If we have a current date and this looks like a transaction line
      if (currentDate != null && _isTransactionLine(line)) {
        // Parse single-line transaction first
        Transaction? transaction = _parseSingleLineTransaction(
          line: line,
          dateString: currentDate,
          id: transactionId,
        );

        if (transaction != null) {
          transactions.add(transaction);
          transactionId++;
        } else {
          // Try multi-line transaction parsing
          final result = _parseMultiLineTransaction(
            startingAt: i,
            lines: lines,
            dateString: currentDate,
            id: transactionId,
          );

          if (result.transaction != null) {
            transactions.add(result.transaction!);
            transactionId++;
            i = result.nextIndex - 1; // Will be incremented at end of loop
          }
        }
      }
    }

    return transactions;
  }

  bool _isHeaderLine(String line) {
    return line.contains('Date') && line.contains('Narration') ||
        line.contains('PageNo.:') ||
        line.contains('AccountBranch:') ||
        line.contains('HDFC') ||
        line.contains('Statement') ||
        line.contains('Opening') ||
        line.contains('Closing') ||
        line.contains('Generated') ||
        line.contains('STATEMENTSUMMARY') ||
        line.contains('Account') ||
        line.contains('Branch');
  }

  bool _isDateLine(String line) {
    return RegExp(r'^\d{2}/\d{2}/\d{2}').hasMatch(line);
  }

  String? _extractDateFromLine(String line) {
    RegExp dateRegex = RegExp(r'^(\d{2}/\d{2}/\d{2})');
    Match? match = dateRegex.firstMatch(line);
    return match?.group(1);
  }

  bool _isTransactionLine(String line) {
    // Check if line contains typical transaction patterns
    return line.contains('UPI-') ||
        line.contains('POS') ||
        line.contains('NEFT') ||
        line.contains('ATW-') ||
        line.contains('NWD-') ||
        line.contains('MEDCSI') ||
        line.contains('IMPS-') ||
        line.contains('INTEREST') ||
        line.contains('FEE-') ||
        line.contains('CRVPOS') ||
        line.contains('DCINTL') ||
        line.contains('DB0000') ||
        RegExp(r'\d{13}').hasMatch(line); // Reference numbers
  }

  ({Transaction? transaction, int nextIndex}) _parseMultiLineTransaction({
    required int startingAt,
    required List<String> lines,
    required String dateString,
    required int id,
  }) {
    String combinedLine = "";
    int i = startingAt;
    bool foundAmountBalance = false;

    bool whileCondition = i < lines.length && !foundAmountBalance;
    int dateLineCount = 0;

    // Combine lines until we find amount and balance
    while (whileCondition) {
      final String line = lines[i].trim();

      if(_isDateLine(line)) {
        /// in hdfc statements, there are two date columns with the same format.
        /// 1st : when the deposit was made
        /// 2nd : when deposit was registered by the bank
        ///
        /// Both of these values are generally the same, we would want to ignore every alternate date column.
        dateLineCount += 1;
      }

      // Stop if we hit another date, empty line, or header
      if (line.isEmpty || dateLineCount > 1 || _isHeaderLine(line)) {
        dateLineCount = 0;
        break;
      }

      combinedLine += "^^$line";

      // Check if this combined line now has amount and balance
      final List<String> components = combinedLine
          .split("^^")
          .where((component) => component.isNotEmpty)
          .toList();

      if (components.length >= 4) {
        final List<String> lastTwo = components.takeLast(2).toList();
        if (_parseAmount(lastTwo[0]) != null && _parseAmount(lastTwo[1]) != null) {
          foundAmountBalance = true;
        }
      }

      i++;
    }

    final Transaction? transaction = _parseSingleLineTransaction(
      line: combinedLine.trim().replaceAll("^^", " "),
      dateString: dateString,
      id: id,
    );

    return (transaction: transaction, nextIndex: i);
  }

  Transaction? _parseSingleLineTransaction({
    required String line,
    required String dateString,
    required int id,
  }) {
    // Split the line into components
    final List<String> components = line
        .split(RegExp(r'\s+'))
        .where((component) => component.isNotEmpty)
        .toList();

    if (components.length < 2) return null;

    // Last component should be balance, second last should be amount
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

    final String name = _extractName(transactionDetails);
    final String description = _determineTransactionType(transactionDetails);

    // Determine if this is a debit or credit
    // Check if there are negative amounts or specific debit indicators
    double finalAmount = amount;
    TransactionType transactionType = TransactionType.income;
    if (transactionDetails.contains('UPI-') ||
        transactionDetails.contains('POS') ||
        transactionDetails.contains('NWD-') ||
        transactionDetails.contains('ATW-') ||
        transactionDetails.contains('FEE-') ||
        transactionDetails.contains('MEDCSI')) {
      transactionType = TransactionType.expense;
    }

    return Transaction(
      id: id,
      notes: name + description,
      amount: finalAmount,
      transactionType: transactionType,
      date: date,
    );
  }

  double? _parseAmount(String amountStr) {
    try {
      // Remove commas and parse
      String cleaned = amountStr.replaceAll(',', '');
      return double.parse(cleaned);
    } catch (e) {
      return null;
    }
  }

  DateTime? _parseDate(String dateStr) {
    try {
      List<String> parts = dateStr.split('/');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      // Convert 2-digit year to 4-digit
      if (year < 50) {
        year += 2000;
      } else {
        year += 1900;
      }

      return DateTime(year, month, day);
    } catch (e) {
      return null;
    }
  }

  String _extractName(String transactionDetails) {
    // UPI transactions
    if (transactionDetails.contains('UPI-')) {
      RegExp upiRegex = RegExp(r'UPI-([^-\s]+)');
      Match? match = upiRegex.firstMatch(transactionDetails);
      if (match != null) {
        return _cleanName(match.group(1) ?? 'UPI Transaction');
      }
    }

    // POS transactions - extract merchant name
    if (transactionDetails.contains('POS') || transactionDetails.contains('MEDCSI')) {
      RegExp merchantRegex = RegExp(r'(?:POS|MEDCSI)[^A-Z]*([A-Z][A-Z\s\.]+)');
      Match? match = merchantRegex.firstMatch(transactionDetails);
      if (match != null) {
        String merchant = match.group(1) ?? 'POS Transaction';
        return _cleanName(merchant);
      }
    }

    // NEFT transactions
    if (transactionDetails.contains('NEFT')) {
      RegExp neftRegex = RegExp(r'NEFT[^-]*-[^-]*-([^-]+)');
      Match? match = neftRegex.firstMatch(transactionDetails);
      if (match != null) {
        return _cleanName(match.group(1) ?? 'NEFT Transfer');
      }
    }

    // ATM/NWD transactions
    if (transactionDetails.contains('NWD-') || transactionDetails.contains('ATW-')) {
      return 'ATM Withdrawal';
    }

    // Interest
    if (transactionDetails.contains('INTEREST')) {
      return 'Interest Credit';
    }

    // Fees
    if (transactionDetails.contains('FEE-')) {
      if (transactionDetails.contains('ATMCASH')) {
        return 'ATM Fee';
      } else if (transactionDetails.contains('DEBITCARD')) {
        return 'Debit Card Fee';
      }
      return 'Bank Fee';
    }

    // IMPS
    if (transactionDetails.contains('IMPS-')) {
      RegExp impsRegex = RegExp(r'IMPS-[^-]*-([^-]+)');
      Match? match = impsRegex.firstMatch(transactionDetails);
      if (match != null) {
        return _cleanName(match.group(1) ?? 'IMPS Transfer');
      }
    }

    // Default: use first meaningful part or the whole details
    List<String> parts = transactionDetails.split('-');
    if (parts.length > 1 && parts[1].trim().isNotEmpty) {
      return _cleanName(parts[1]);
    }

    return _cleanName(transactionDetails);
  }

  String _determineTransactionType(String transactionDetails) {
    if (transactionDetails.contains('UPI-')) return 'UPI Payment';
    if (transactionDetails.contains('POS')) return 'Card Payment';
    if (transactionDetails.contains('MEDCSI')) return 'Online Payment';
    if (transactionDetails.contains('NEFT')) return 'NEFT Transfer';
    if (transactionDetails.contains('IMPS-')) return 'IMPS Transfer';
    if (transactionDetails.contains('ATW-') || transactionDetails.contains('NWD-')) return 'ATM Withdrawal';
    if (transactionDetails.contains('INTEREST')) return 'Interest Credit';
    if (transactionDetails.contains('FEE-')) return 'Bank Fee';
    if (transactionDetails.contains('CRVPOS')) return 'Card Reversal';
    if (transactionDetails.contains('DCINTL')) return 'International Transaction Fee';

    return 'Bank Transaction';
  }

  String _cleanName(String name) {
    return name
        .replaceAll(RegExp(r'[0-9@._\*]+'), '') // Remove numbers and special chars
        .replaceAll(RegExp(r'X+'), '') // Remove X's (masked digits)
        .replaceAll(RegExp(r'\s+'), ' ') // Normalize spaces
        .trim()
        .split(' ')
        .where((word) => word.length > 1) // Remove single characters
        .map((word) => word.isNotEmpty ?
    word[0].toUpperCase() + word.substring(1).toLowerCase() : '')
        .join(' ')
        .trim();
  }
}