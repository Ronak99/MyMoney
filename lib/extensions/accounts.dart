import 'package:my_money/model/account.dart';

extension AccountsExtension on List<Account> {
  double get totalBalance => fold(0, (sum, account) => sum + account.balance);
}
