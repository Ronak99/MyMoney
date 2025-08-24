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
  bool? get isLoading => throw _privateConstructorUsedError;
  String? get previousPassword => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {bool? isLoading,
      String? previousPassword,
      List<Transaction> transactions});
}

/// @nodoc
class _$ImportStateCopyWithImpl<$Res, $Val extends ImportState>
    implements $ImportStateCopyWith<$Res> {
  _$ImportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? previousPassword = freezed,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      previousPassword: freezed == previousPassword
          ? _value.previousPassword
          : previousPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
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
      {bool? isLoading,
      String? previousPassword,
      List<Transaction> transactions});
}

/// @nodoc
class __$$ImportStateImplCopyWithImpl<$Res>
    extends _$ImportStateCopyWithImpl<$Res, _$ImportStateImpl>
    implements _$$ImportStateImplCopyWith<$Res> {
  __$$ImportStateImplCopyWithImpl(
      _$ImportStateImpl _value, $Res Function(_$ImportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? previousPassword = freezed,
    Object? transactions = null,
  }) {
    return _then(_$ImportStateImpl(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      previousPassword: freezed == previousPassword
          ? _value.previousPassword
          : previousPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$ImportStateImpl implements _ImportState {
  _$ImportStateImpl(
      {this.isLoading = false,
      this.previousPassword = null,
      final List<Transaction> transactions = const []})
      : _transactions = transactions;

  @override
  @JsonKey()
  final bool? isLoading;
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
  String toString() {
    return 'ImportState(isLoading: $isLoading, previousPassword: $previousPassword, transactions: $transactions)';
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
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, previousPassword,
      const DeepCollectionEquality().hash(_transactions));

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImportStateImplCopyWith<_$ImportStateImpl> get copyWith =>
      __$$ImportStateImplCopyWithImpl<_$ImportStateImpl>(this, _$identity);
}

abstract class _ImportState implements ImportState {
  factory _ImportState(
      {final bool? isLoading,
      final String? previousPassword,
      final List<Transaction> transactions}) = _$ImportStateImpl;

  @override
  bool? get isLoading;
  @override
  String? get previousPassword;
  @override
  List<Transaction> get transactions;

  /// Create a copy of ImportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImportStateImplCopyWith<_$ImportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
