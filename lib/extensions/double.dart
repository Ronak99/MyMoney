import 'package:intl/intl.dart';

final numberFormat = NumberFormat("#,##0.00", "en_US");

extension DoubleExtensions on num {
  String get formatCurrency => numberFormat.format(this);
}