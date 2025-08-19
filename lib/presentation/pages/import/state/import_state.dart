import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  factory ImportState({
    @Default(false) bool? isLoading,
  }) = _ImportState;
}
