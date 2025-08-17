import 'package:freezed_annotation/freezed_annotation.dart';

part 'modify_account_state.freezed.dart';

@freezed
class ModifyAccountState with _$ModifyAccountState {
  factory ModifyAccountState({
    String? name,
    double? balance,
    DateTime? createdOn,
  }) = _ModifyAccountState;
}
