// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImportState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get previousPassword => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  File? get selectedFile => throw _privateConstructorUsedError;
  Bank? get selectedBank => throw _privateConstructorUsedError;
  PeerApp? get selectedPeerApp => throw _privateConstructorUsedError;
  String? get assetFileName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImportStateCopyWith<ImportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportStateCopyWith<$Res> {
  factory $ImportStateCopyWith(
          ImportState value, $Res Function(ImportState) then) =
      _$ImportStateCopyWithImpl<$Res, ImportState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? previousPassword,
      List<Transaction> transactions,
      DateTime? selectedDate,
      File? selectedFile,
      Bank? selectedBank,
      PeerApp? selectedPeerApp,
      String? assetFileName});
}

/// @nodoc
class _$ImportStateCopyWithImpl<$Res, $Val extends ImportState>
    implements $ImportStateCopyWith<$Res> {
  _$ImportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? previousPassword = freezed,
    Object? transactions = null,
    Object? selectedDate = freezed,
    Object? selectedFile = freezed,
    Object? selectedBank = freezed,
    Object? selectedPeerApp = freezed,
    Object? assetFileName = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      previousPassword: freezed == previousPassword
          ? _value.previousPassword
          : previousPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedFile: freezed == selectedFile
          ? _value.selectedFile
          : selectedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      selectedBank: freezed == selectedBank
          ? _value.selectedBank
          : selectedBank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      selectedPeerApp: freezed == selectedPeerApp
          ? _value.selectedPeerApp
          : selectedPeerApp // ignore: cast_nullable_to_non_nullable
              as PeerApp?,
      assetFileName: freezed == assetFileName
          ? _value.assetFileName
          : assetFileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImportStateImplCopyWith<$Res>
    implements $ImportStateCopyWith<$Res> {
  factory _$$ImportStateImplCopyWith(
          _$ImportStateImpl value, $Res Function(_$ImportStateImpl) then) =
      __$$ImportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? previousPassword,
      List<Transaction> transactions,
      DateTime? selectedDate,
      File? selectedFile,
      Bank? selectedBank,
      PeerApp? selectedPeerApp,
      String? assetFileName});
}

/// @nodoc
class __$$ImportStateImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportStateImpl>
    implements _$$ImportStateImplCopyWith<$Res> {
  __$$ImportStateImplCopyWithImpl(
      _$ImportStateImpl _value, $Res Function(_$ImportStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? previousPassword = freezed,
    Object? transactions = null,
    Object? selectedDate = freezed,
    Object? selectedFile = freezed,
    Object? selectedBank = freezed,
    Object? selectedPeerApp = freezed,
    Object? assetFileName = freezed,
  }) {
    return _then(_$ImportStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      previousPassword: freezed == previousPassword
          ? _value.previousPassword
          : previousPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedFile: freezed == selectedFile
          ? _value.selectedFile
          : selectedFile // ignore: cast_nullable_to_non_nullable
              as File?,
      selectedBank: freezed == selectedBank
          ? _value.selectedBank
          : selectedBank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      selectedPeerApp: freezed == selectedPeerApp
          ? _value.selectedPeerApp
          : selectedPeerApp // ignore: cast_nullable_to_non_nullable
              as PeerApp?,
      assetFileName: freezed == assetFileName
          ? _value.assetFileName
          : assetFileName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ImportStateImpl implements _ImportState {
  _$ImportStateImpl(
      {this.isLoading = false,
      this.previousPassword = null,
      final List<Transaction> transactions = const [],
      this.selectedDate,
      this.selectedFile = null,
      this.selectedBank = null,
      this.selectedPeerApp = null,
      this.assetFileName = null})
      : _transactions = transactions;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? previousPassword;
  final List<Transaction> _transactions;
  @override
  @JsonKey()
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final File? selectedFile;
  @override
  @JsonKey()
  final Bank? selectedBank;
  @override
  @JsonKey()
  final PeerApp? selectedPeerApp;
  @override
  @JsonKey()
  final String? assetFileName;

  @override
  String toString() {
    return 'ImportState(isLoading: $isLoading, previousPassword: $previousPassword, transactions: $transactions, selectedDate: $selectedDate, selectedFile: $selectedFile, selectedBank: $selectedBank, selectedPeerApp: $selectedPeerApp, assetFileName: $assetFileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImportStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.previousPassword, previousPassword) ||
                other.previousPassword == previousPassword) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedFile, selectedFile) ||
                other.selectedFile == selectedFile) &&
            (identical(other.selectedBank, selectedBank) ||
                other.selectedBank == selectedBank) &&
            (identical(other.selectedPeerApp, selectedPeerApp) ||
                other.selectedPeerApp == selectedPeerApp) &&
            (identical(other.assetFileName, assetFileName) ||
                other.assetFileName == assetFileName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      previousPassword,
      const DeepCollectionEquality().hash(_transactions),
      selectedDate,
      selectedFile,
      selectedBank,
      selectedPeerApp,
      assetFileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportStateImplCopyWith<_$ImportStateImpl> get copyWith =>
      __$$ImportStateImplCopyWithImpl<_$ImportStateImpl>(this, _$identity);
}

abstract class _ImportState implements ImportState {
  factory _ImportState(
      {final bool isLoading,
      final String? previousPassword,
      final List<Transaction> transactions,
      final DateTime? selectedDate,
      final File? selectedFile,
      final Bank? selectedBank,
      final PeerApp? selectedPeerApp,
      final String? assetFileName}) = _$ImportStateImpl;

  @override
  bool get isLoading;
  @override
  String? get previousPassword;
  @override
  List<Transaction> get transactions;
  @override
  DateTime? get selectedDate;
  @override
  File? get selectedFile;
  @override
  Bank? get selectedBank;
  @override
  PeerApp? get selectedPeerApp;
  @override
  String? get assetFileName;
  @override
  @JsonKey(ignore: true)
  _$$ImportStateImplCopyWith<_$ImportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
