// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateTransactionState {
  TransactionType? get transactionType => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  TransactionCategory? get category => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  /// Create a copy of CreateTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTransactionStateCopyWith<CreateTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransactionStateCopyWith<$Res> {
  factory $CreateTransactionStateCopyWith(CreateTransactionState value,
          $Res Function(CreateTransactionState) then) =
      _$CreateTransactionStateCopyWithImpl<$Res, CreateTransactionState>;
  @useResult
  $Res call(
      {TransactionType? transactionType,
      Account? account,
      TransactionCategory? category,
      String? name,
      String? description,
      double? amount,
      DateTime? date});
}

/// @nodoc
class _$CreateTransactionStateCopyWithImpl<$Res,
        $Val extends CreateTransactionState>
    implements $CreateTransactionStateCopyWith<$Res> {
  _$CreateTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = freezed,
    Object? account = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTransactionStateImplCopyWith<$Res>
    implements $CreateTransactionStateCopyWith<$Res> {
  factory _$$CreateTransactionStateImplCopyWith(
          _$CreateTransactionStateImpl value,
          $Res Function(_$CreateTransactionStateImpl) then) =
      __$$CreateTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionType? transactionType,
      Account? account,
      TransactionCategory? category,
      String? name,
      String? description,
      double? amount,
      DateTime? date});
}

/// @nodoc
class __$$CreateTransactionStateImplCopyWithImpl<$Res>
    extends _$CreateTransactionStateCopyWithImpl<$Res,
        _$CreateTransactionStateImpl>
    implements _$$CreateTransactionStateImplCopyWith<$Res> {
  __$$CreateTransactionStateImplCopyWithImpl(
      _$CreateTransactionStateImpl _value,
      $Res Function(_$CreateTransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = freezed,
    Object? account = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? amount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$CreateTransactionStateImpl(
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CreateTransactionStateImpl implements _CreateTransactionState {
  _$CreateTransactionStateImpl(
      {this.transactionType = TransactionType.expense,
      this.account,
      this.category,
      this.name,
      this.description,
      this.amount,
      this.date});

  @override
  @JsonKey()
  final TransactionType? transactionType;
  @override
  final Account? account;
  @override
  final TransactionCategory? category;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? amount;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'CreateTransactionState(transactionType: $transactionType, account: $account, category: $category, name: $name, description: $description, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionStateImpl &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionType, account,
      category, name, description, amount, date);

  /// Create a copy of CreateTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionStateImplCopyWith<_$CreateTransactionStateImpl>
      get copyWith => __$$CreateTransactionStateImplCopyWithImpl<
          _$CreateTransactionStateImpl>(this, _$identity);
}

abstract class _CreateTransactionState implements CreateTransactionState {
  factory _CreateTransactionState(
      {final TransactionType? transactionType,
      final Account? account,
      final TransactionCategory? category,
      final String? name,
      final String? description,
      final double? amount,
      final DateTime? date}) = _$CreateTransactionStateImpl;

  @override
  TransactionType? get transactionType;
  @override
  Account? get account;
  @override
  TransactionCategory? get category;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get amount;
  @override
  DateTime? get date;

  /// Create a copy of CreateTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransactionStateImplCopyWith<_$CreateTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
