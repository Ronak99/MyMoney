import 'package:my_money/model/transaction.dart';

extension TransactionExtensions  on List<Transaction> {
  Map<DateTime, List<Transaction>> get groupByDate {
    Map<DateTime, List<Transaction>> map = {};

    forEach((transaction) {
      if(map.containsKey(transaction.date)) {
        map[transaction.date]!.add(transaction);
      } else {
        map[transaction.date] = [transaction];
      }
    });

    return map;
  }
}