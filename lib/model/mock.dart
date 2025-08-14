import 'package:my_money/model/transaction.dart';

class Mock {

  List<Transaction> transactions = [
    Transaction(description: "description", name: "name", amount: 23.0, date: DateTime.now()),
  ];

}