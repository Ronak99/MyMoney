import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/extensions/peer_app.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/packages/parser/parser.dart';

part 'import_state.freezed.dart';

@freezed
class ImportState with _$ImportState {
  factory ImportState({
    @Default(false) bool isLoading,
    @Default(null) String? previousPassword,
    @Default([]) List<Transaction> transactions,
    DateTime? selectedDate,
    @Default(null) File? selectedFile,
    @Default(null) Bank? selectedBank,
    @Default(null) PeerApp? selectedPeerApp,
    @Default(null) String? assetFileName,
  }) = _ImportState;
}
