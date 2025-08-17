// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modify_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ModifyAccountState {
  String? get name => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;

  /// Create a copy of ModifyAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifyAccountStateCopyWith<ModifyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyAccountStateCopyWith<$Res> {
  factory $ModifyAccountStateCopyWith(
          ModifyAccountState value, $Res Function(ModifyAccountState) then) =
      _$ModifyAccountStateCopyWithImpl<$Res, ModifyAccountState>;
  @useResult
  $Res call({String? name, double? balance, DateTime? createdOn});
}

/// @nodoc
class _$ModifyAccountStateCopyWithImpl<$Res, $Val extends ModifyAccountState>
    implements $ModifyAccountStateCopyWith<$Res> {
  _$ModifyAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifyAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? balance = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifyAccountStateImplCopyWith<$Res>
    implements $ModifyAccountStateCopyWith<$Res> {
  factory _$$ModifyAccountStateImplCopyWith(_$ModifyAccountStateImpl value,
          $Res Function(_$ModifyAccountStateImpl) then) =
      __$$ModifyAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, double? balance, DateTime? createdOn});
}

/// @nodoc
class __$$ModifyAccountStateImplCopyWithImpl<$Res>
    extends _$ModifyAccountStateCopyWithImpl<$Res, _$ModifyAccountStateImpl>
    implements _$$ModifyAccountStateImplCopyWith<$Res> {
  __$$ModifyAccountStateImplCopyWithImpl(_$ModifyAccountStateImpl _value,
      $Res Function(_$ModifyAccountStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifyAccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? balance = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$ModifyAccountStateImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ModifyAccountStateImpl implements _ModifyAccountState {
  _$ModifyAccountStateImpl({this.name, this.balance, this.createdOn});

  @override
  final String? name;
  @override
  final double? balance;
  @override
  final DateTime? createdOn;

  @override
  String toString() {
    return 'ModifyAccountState(name: $name, balance: $balance, createdOn: $createdOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyAccountStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, balance, createdOn);

  /// Create a copy of ModifyAccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyAccountStateImplCopyWith<_$ModifyAccountStateImpl> get copyWith =>
      __$$ModifyAccountStateImplCopyWithImpl<_$ModifyAccountStateImpl>(
          this, _$identity);
}

abstract class _ModifyAccountState implements ModifyAccountState {
  factory _ModifyAccountState(
      {final String? name,
      final double? balance,
      final DateTime? createdOn}) = _$ModifyAccountStateImpl;

  @override
  String? get name;
  @override
  double? get balance;
  @override
  DateTime? get createdOn;

  /// Create a copy of ModifyAccountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifyAccountStateImplCopyWith<_$ModifyAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
