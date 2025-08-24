import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/transaction.dart';

part 'import_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  factory ImportState({
    @Default(false) bool? isLoading,
    @Default(null) String? previousPassword,
    @Default([]) List<Transaction> transactions,
  }) = _ImportState;
}
