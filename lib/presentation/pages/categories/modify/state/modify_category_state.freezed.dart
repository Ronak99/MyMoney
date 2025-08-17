// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modify_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ModifyCategoryState {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  CategoryType? get type => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;

  /// Create a copy of ModifyCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModifyCategoryStateCopyWith<ModifyCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyCategoryStateCopyWith<$Res> {
  factory $ModifyCategoryStateCopyWith(
          ModifyCategoryState value, $Res Function(ModifyCategoryState) then) =
      _$ModifyCategoryStateCopyWithImpl<$Res, ModifyCategoryState>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      CategoryType? type,
      DateTime? createdOn});
}

/// @nodoc
class _$ModifyCategoryStateCopyWithImpl<$Res, $Val extends ModifyCategoryState>
    implements $ModifyCategoryStateCopyWith<$Res> {
  _$ModifyCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModifyCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifyCategoryStateImplCopyWith<$Res>
    implements $ModifyCategoryStateCopyWith<$Res> {
  factory _$$ModifyCategoryStateImplCopyWith(_$ModifyCategoryStateImpl value,
          $Res Function(_$ModifyCategoryStateImpl) then) =
      __$$ModifyCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      CategoryType? type,
      DateTime? createdOn});
}

/// @nodoc
class __$$ModifyCategoryStateImplCopyWithImpl<$Res>
    extends _$ModifyCategoryStateCopyWithImpl<$Res, _$ModifyCategoryStateImpl>
    implements _$$ModifyCategoryStateImplCopyWith<$Res> {
  __$$ModifyCategoryStateImplCopyWithImpl(_$ModifyCategoryStateImpl _value,
      $Res Function(_$ModifyCategoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModifyCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$ModifyCategoryStateImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ModifyCategoryStateImpl implements _ModifyCategoryState {
  _$ModifyCategoryStateImpl(
      {this.name,
      this.description,
      this.type = CategoryType.expense,
      this.createdOn});

  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey()
  final CategoryType? type;
  @override
  final DateTime? createdOn;

  @override
  String toString() {
    return 'ModifyCategoryState(name: $name, description: $description, type: $type, createdOn: $createdOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyCategoryStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, type, createdOn);

  /// Create a copy of ModifyCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyCategoryStateImplCopyWith<_$ModifyCategoryStateImpl> get copyWith =>
      __$$ModifyCategoryStateImplCopyWithImpl<_$ModifyCategoryStateImpl>(
          this, _$identity);
}

abstract class _ModifyCategoryState implements ModifyCategoryState {
  factory _ModifyCategoryState(
      {final String? name,
      final String? description,
      final CategoryType? type,
      final DateTime? createdOn}) = _$ModifyCategoryStateImpl;

  @override
  String? get name;
  @override
  String? get description;
  @override
  CategoryType? get type;
  @override
  DateTime? get createdOn;

  /// Create a copy of ModifyCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModifyCategoryStateImplCopyWith<_$ModifyCategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
