extension DateExtension on DateTime {
  DateTime get startOfTheMonth => DateTime(year, month, 1);
  DateTime get endOfTheMonth => DateTime(year, month + 1, 0);
  DateTime get nextMonth => DateTime(year, month + 1, 1);
  DateTime get prevMonth => DateTime(year, month, 0);
}
