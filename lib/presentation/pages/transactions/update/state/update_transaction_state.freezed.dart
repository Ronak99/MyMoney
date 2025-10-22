// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateTransactionState {
  Transaction? get transaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateTransactionStateCopyWith<UpdateTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTransactionStateCopyWith<$Res> {
  factory $UpdateTransactionStateCopyWith(UpdateTransactionState value,
          $Res Function(UpdateTransactionState) then) =
      _$UpdateTransactionStateCopyWithImpl<$Res, UpdateTransactionState>;
  @useResult
  $Res call({Transaction? transaction});
}

/// @nodoc
class _$UpdateTransactionStateCopyWithImpl<$Res,
        $Val extends UpdateTransactionState>
    implements $UpdateTransactionStateCopyWith<$Res> {
  _$UpdateTransactionStateCopyWithImpl(this._value, this._then);

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
abstract class _$$UpdateTransactionStateImplCopyWith<$Res>
    implements $UpdateTransactionStateCopyWith<$Res> {
  factory _$$UpdateTransactionStateImplCopyWith(
          _$UpdateTransactionStateImpl value,
          $Res Function(_$UpdateTransactionStateImpl) then) =
      __$$UpdateTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Transaction? transaction});
}

/// @nodoc
class __$$UpdateTransactionStateImplCopyWithImpl<$Res>
    extends _$UpdateTransactionStateCopyWithImpl<$Res,
        _$UpdateTransactionStateImpl>
    implements _$$UpdateTransactionStateImplCopyWith<$Res> {
  __$$UpdateTransactionStateImplCopyWithImpl(
      _$UpdateTransactionStateImpl _value,
      $Res Function(_$UpdateTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = freezed,
  }) {
    return _then(_$UpdateTransactionStateImpl(
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
    ));
  }
}

/// @nodoc

class _$UpdateTransactionStateImpl extends _UpdateTransactionState {
  _$UpdateTransactionStateImpl({this.transaction = null}) : super._();

  @override
  @JsonKey()
  final Transaction? transaction;

  @override
  String toString() {
    return 'UpdateTransactionState(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransactionStateImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransactionStateImplCopyWith<_$UpdateTransactionStateImpl>
      get copyWith => __$$UpdateTransactionStateImplCopyWithImpl<
          _$UpdateTransactionStateImpl>(this, _$identity);
}

abstract class _UpdateTransactionState extends UpdateTransactionState {
  factory _UpdateTransactionState({final Transaction? transaction}) =
      _$UpdateTransactionStateImpl;
  _UpdateTransactionState._() : super._();

  @override
  Transaction? get transaction;
  @override
  @JsonKey(ignore: true)
  _$$UpdateTransactionStateImplCopyWith<_$UpdateTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
