import 'package:my_money/model/transaction.dart';
import 'package:my_money/packages/parser/parser.dart';

class HdfcStatementParser extends BankStatementParser {
  @override
  List<Transaction> parse(String text) {
    // TODO: implement parse
    throw UnimplementedError();
  }
}