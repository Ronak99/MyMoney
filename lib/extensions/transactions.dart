import 'package:my_money/extensions/date.dart';
import 'package:my_money/model/transaction.dart';

extension TransactionExtensions  on List<Transaction> {
  Map<String, List<Transaction>> get groupByDate {
    Map<String, List<Transaction>> map = {};

    forEach((transaction) {
      if(map.containsKey(transaction.date.formatDate)) {
        map[transaction.date.formatDate]!.add(transaction);
      } else {
        map[transaction.date.formatDate] = [transaction];
      }
    });

    return map;
  }
}