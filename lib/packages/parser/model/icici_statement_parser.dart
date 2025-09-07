part of '../parser.dart';

class IciciStatmentParser implements Parser {
  final int currentYear = DateTime.now().year;

  @override
  List<Transaction> parse(String statementText) {
    List<Transaction> transactions = [];
    List<String> lines = statementText.split('\n');

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].trim();

      // Check if line matches date pattern (DD-MM-YYYY)
      if (RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(line)) {
        String dateStr = line;

        // Look for description in next lines
        String description = '';
        String amountStr = '';
        String typeStr = '';

        for (int j = i + 1; j < lines.length && j < i + 4; j++) {
          String nextLine = lines[j].trim();

          // Check if this line contains amount and type (CR/DR)
          if (RegExp(r'^\d+\.\d{2}$').hasMatch(nextLine)) {
            amountStr = nextLine;
            // Check if next line has CR/DR
            if (j + 1 < lines.length) {
              String typeLine = lines[j + 1].trim();
              if (typeLine == 'CR' || typeLine == 'DR') {
                typeStr = typeLine;
                break;
              }
            }
          }
          // If line starts with UPI/ or NEFT- or MIN/, it's description
          else if (nextLine.startsWith('UPI/') ||
              nextLine.startsWith('NEFT-') ||
              nextLine.startsWith('MIN/')) {
            description = nextLine;
          }
          // If line is empty or starts with next date, stop
          else if (nextLine.isEmpty ||
              RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(nextLine)) {
            break;
          }
          // Otherwise, append to description
          else if (description.isNotEmpty && nextLine.isNotEmpty) {
            description += ' ' + nextLine;
          }
        }

        if (description.isNotEmpty &&
            amountStr.isNotEmpty &&
            typeStr.isNotEmpty) {
          try {
            DateTime date =
                DateTime.parse(dateStr.split('-').reversed.join('-'));
            double amount = double.parse(amountStr);

            TransactionType type = TransactionType.income;

            // Make amount negative for debit transactions
            if (typeStr == 'DR') {
              type= TransactionType.expense;
            }

            // Extract name from description
            String name = extractNameFromDescription(description);

            transactions.add(
              Transaction(
                id: transactions.length + 1,
                notes: name + description,
                amount: amount,
                date: date,
                transactionType: type,
              ),
            );
          } catch (e) {
            // Skip malformed entries
          }
        }
      }
    }

    return transactions;
  }

  String extractNameFromDescription(String description) {
    if (description.startsWith('UPI/')) {
      // Extract name after first slash and before second slash
      List<String> parts = description.split('/');
      if (parts.length > 1) {
        return parts[1];
      }
    } else if (description.startsWith('NEFT-')) {
      // Try to extract from account name part
      List<String> parts = description.split('-');
      if (parts.length > 2) {
        String namePart = parts[2];
        if (namePart.contains(' ')) {
          return namePart.split(' ')[0];
        }
        return namePart;
      }
    } else if (description.startsWith('MIN/')) {
      // Extract service name
      List<String> parts = description.split('/');
      if (parts.length > 1) {
        return parts[1];
      }
    }

    return 'Unknown';
  }
}
