part of '../parser.dart';

class CsvParser implements Parser {
  @override
  List<Transaction> parse(String csvString) {
    List<Transaction> transactions = [];

    // Split by lines and remove empty lines
    List<String> lines = csvString
        .trim()
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();

    if (lines.isEmpty) return transactions;

    // Skip the header row (first line)
    for (int i = 1; i < lines.length; i++) {
      try {
        Transaction? transaction = _parseCsvLine(lines[i]);
        if (transaction != null) {
          transactions.add(transaction);
        }
      } catch (e) {
        print('Error parsing line ${i + 1}: $e');
        // Continue parsing other lines even if one fails
      }
    }

    return transactions;
  }

  static Transaction? _parseCsvLine(String line) {
    List<String> fields = _parseCsvFields(line);

    if (fields.length != 6) {
      print('Invalid number of fields: ${fields.length}');
      return null;
    }

    try {
      // Parse date
      DateTime date = _parseDate(fields[0]);

      // Parse transaction type
      TransactionType transactionType = _parseTransactionType(fields[1]);

      // Parse amount
      double amount = double.parse(fields[2]);

      // Extract other fields
      String category = fields[3];
      String account = fields[4];
      String notes = fields[5];

      return Transaction(
        date: date,
        transactionType: transactionType,
        amount: amount,
        category: null,
        account: null,
        notes: notes,
      );
    } catch (e) {
      print('Error parsing transaction fields: $e');
      return null;
    }
  }

  static List<String> _parseCsvFields(String line) {
    List<String> fields = [];
    bool inQuotes = false;
    String currentField = '';

    for (int i = 0; i < line.length; i++) {
      String char = line[i];

      if (char == '"') {
        if (inQuotes && i + 1 < line.length && line[i + 1] == '"') {
          // Handle escaped quote ("")
          currentField += '"';
          i++; // Skip the next quote
        } else {
          // Toggle quote state
          inQuotes = !inQuotes;
        }
      } else if (char == ',' && !inQuotes) {
        // Field separator found outside quotes
        fields.add(currentField.trim());
        currentField = '';
      } else {
        currentField += char;
      }
    }

    // Add the last field
    fields.add(currentField.trim());

    return fields;
  }

  static DateTime _parseDate(String dateString) {
    // Parse format: "Apr 01, 2025 9:57 AM"
    try {
      // Remove quotes if present
      dateString = dateString.replaceAll('"', '').trim();

      // Split date and time
      List<String> parts = dateString.split(' ');
      if (parts.length < 4) throw FormatException('Invalid date format');

      // Parse month
      String monthStr = parts[0];
      int month = _getMonthNumber(monthStr);

      // Parse day (remove comma)
      int day = int.parse(parts[1].replaceAll(',', ''));

      // Parse year
      int year = int.parse(parts[2]);

      // Parse time
      String timeStr = parts[3];
      String amPm = parts.length > 4 ? parts[4] : '';

      List<String> timeParts = timeStr.split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      // Handle AM/PM
      if (amPm.toUpperCase() == 'PM' && hour != 12) {
        hour += 12;
      } else if (amPm.toUpperCase() == 'AM' && hour == 12) {
        hour = 0;
      }

      return DateTime(year, month, day, hour, minute);
    } catch (e) {
      throw FormatException('Failed to parse date: $dateString');
    }
  }

  static int _getMonthNumber(String monthAbbr) {
    const months = {
      'Jan': 1,
      'Feb': 2,
      'Mar': 3,
      'Apr': 4,
      'May': 5,
      'Jun': 6,
      'Jul': 7,
      'Aug': 8,
      'Sep': 9,
      'Oct': 10,
      'Nov': 11,
      'Dec': 12
    };

    int? month = months[monthAbbr];
    if (month == null) {
      throw FormatException('Invalid month abbreviation: $monthAbbr');
    }
    return month;
  }

  static TransactionType _parseTransactionType(String typeString) {
    typeString = typeString.replaceAll('"', '').trim().toLowerCase();

    if (typeString.contains('income') || typeString.contains('(+)')) {
      return TransactionType.income;
    } else if (typeString.contains('expense') || typeString.contains('(-)')) {
      return TransactionType.expense;
    }

    return TransactionType.none;
  }
}
