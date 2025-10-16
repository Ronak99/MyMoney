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
  Transaction? get transaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTransactionStateCopyWith<CreateTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTransactionStateCopyWith<$Res> {
  factory $CreateTransactionStateCopyWith(CreateTransactionState value,
          $Res Function(CreateTransactionState) then) =
      _$CreateTransactionStateCopyWithImpl<$Res, CreateTransactionState>;
  @useResult
  $Res call({Transaction? transaction});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
  }) {
    return _then(_value.copyWith(
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
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
  $Res call({Transaction? transaction});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
  }) {
    return _then(_$CreateTransactionStateImpl(
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
    ));
  }
}

/// @nodoc

class _$CreateTransactionStateImpl extends _CreateTransactionState {
  _$CreateTransactionStateImpl({this.transaction = null}) : super._();

  @override
  @JsonKey()
  final Transaction? transaction;

  @override
  String toString() {
    return 'CreateTransactionState(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionStateImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionStateImplCopyWith<_$CreateTransactionStateImpl>
      get copyWith => __$$CreateTransactionStateImplCopyWithImpl<
          _$CreateTransactionStateImpl>(this, _$identity);
}

abstract class _CreateTransactionState extends CreateTransactionState {
  factory _CreateTransactionState({final Transaction? transaction}) =
      _$CreateTransactionStateImpl;
  _CreateTransactionState._() : super._();

  @override
  Transaction? get transaction;
  @override
  @JsonKey(ignore: true)
  _$$CreateTransactionStateImplCopyWith<_$CreateTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
