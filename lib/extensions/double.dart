import 'package:intl/intl.dart';

final numberFormat = NumberFormat("##,##,##,##0", "en_US");

extension DoubleExtensions on num {
  String get formatCurrency => "₹ ${numberFormat.format(this)}";
}