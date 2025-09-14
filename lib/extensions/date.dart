import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

extension DateExtension on DateTime {
  DateTime get startOfTheMonth => DateTime(year, month, 1);
  DateTime get endOfTheMonth => DateTime(year, month + 1, 0);
  DateTime get nextMonth => DateTime(year, month + 1, 1);
  DateTime get prevMonth => DateTime(year, month, 0);

  String get formatDate => Jiffy.parseFromDateTime(this).yMMMMd;
  String get monthYear => Jiffy.parseFromDateTime(this).format(pattern: "MMMM, yyyy");
  String get formatTime => Jiffy.parseFromDateTime(this).Hms;

  TimeOfDay get time => TimeOfDay(hour: hour, minute: minute);
}
