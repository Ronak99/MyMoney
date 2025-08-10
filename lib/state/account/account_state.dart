import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/account.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  factory AccountState({
    @Default([]) List<Account> accounts,
}) = _AccountState;
}
