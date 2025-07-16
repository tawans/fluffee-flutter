// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MenuOption {
  String get id => throw _privateConstructorUsedError;
  String get menuId => throw _privateConstructorUsedError;
  OptionType get optionType => throw _privateConstructorUsedError;
  String get optionName => throw _privateConstructorUsedError;
  int get priceAdjustment => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuOptionCopyWith<MenuOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionCopyWith<$Res> {
  factory $MenuOptionCopyWith(
    MenuOption value,
    $Res Function(MenuOption) then,
  ) = _$MenuOptionCopyWithImpl<$Res, MenuOption>;
  @useResult
  $Res call({
    String id,
    String menuId,
    OptionType optionType,
    String optionName,
    int priceAdjustment,
    bool isDefault,
    DateTime createdAt,
  });
}

/// @nodoc
class _$MenuOptionCopyWithImpl<$Res, $Val extends MenuOption>
    implements $MenuOptionCopyWith<$Res> {
  _$MenuOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuId = null,
    Object? optionType = null,
    Object? optionName = null,
    Object? priceAdjustment = null,
    Object? isDefault = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            menuId: null == menuId
                ? _value.menuId
                : menuId // ignore: cast_nullable_to_non_nullable
                      as String,
            optionType: null == optionType
                ? _value.optionType
                : optionType // ignore: cast_nullable_to_non_nullable
                      as OptionType,
            optionName: null == optionName
                ? _value.optionName
                : optionName // ignore: cast_nullable_to_non_nullable
                      as String,
            priceAdjustment: null == priceAdjustment
                ? _value.priceAdjustment
                : priceAdjustment // ignore: cast_nullable_to_non_nullable
                      as int,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuOptionImplCopyWith<$Res>
    implements $MenuOptionCopyWith<$Res> {
  factory _$$MenuOptionImplCopyWith(
    _$MenuOptionImpl value,
    $Res Function(_$MenuOptionImpl) then,
  ) = __$$MenuOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String menuId,
    OptionType optionType,
    String optionName,
    int priceAdjustment,
    bool isDefault,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$MenuOptionImplCopyWithImpl<$Res>
    extends _$MenuOptionCopyWithImpl<$Res, _$MenuOptionImpl>
    implements _$$MenuOptionImplCopyWith<$Res> {
  __$$MenuOptionImplCopyWithImpl(
    _$MenuOptionImpl _value,
    $Res Function(_$MenuOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuId = null,
    Object? optionType = null,
    Object? optionName = null,
    Object? priceAdjustment = null,
    Object? isDefault = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$MenuOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        menuId: null == menuId
            ? _value.menuId
            : menuId // ignore: cast_nullable_to_non_nullable
                  as String,
        optionType: null == optionType
            ? _value.optionType
            : optionType // ignore: cast_nullable_to_non_nullable
                  as OptionType,
        optionName: null == optionName
            ? _value.optionName
            : optionName // ignore: cast_nullable_to_non_nullable
                  as String,
        priceAdjustment: null == priceAdjustment
            ? _value.priceAdjustment
            : priceAdjustment // ignore: cast_nullable_to_non_nullable
                  as int,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$MenuOptionImpl extends _MenuOption {
  const _$MenuOptionImpl({
    required this.id,
    required this.menuId,
    required this.optionType,
    required this.optionName,
    this.priceAdjustment = 0,
    this.isDefault = false,
    required this.createdAt,
  }) : super._();

  @override
  final String id;
  @override
  final String menuId;
  @override
  final OptionType optionType;
  @override
  final String optionName;
  @override
  @JsonKey()
  final int priceAdjustment;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MenuOption(id: $id, menuId: $menuId, optionType: $optionType, optionName: $optionName, priceAdjustment: $priceAdjustment, isDefault: $isDefault, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.optionType, optionType) ||
                other.optionType == optionType) &&
            (identical(other.optionName, optionName) ||
                other.optionName == optionName) &&
            (identical(other.priceAdjustment, priceAdjustment) ||
                other.priceAdjustment == priceAdjustment) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    menuId,
    optionType,
    optionName,
    priceAdjustment,
    isDefault,
    createdAt,
  );

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionImplCopyWith<_$MenuOptionImpl> get copyWith =>
      __$$MenuOptionImplCopyWithImpl<_$MenuOptionImpl>(this, _$identity);
}

abstract class _MenuOption extends MenuOption {
  const factory _MenuOption({
    required final String id,
    required final String menuId,
    required final OptionType optionType,
    required final String optionName,
    final int priceAdjustment,
    final bool isDefault,
    required final DateTime createdAt,
  }) = _$MenuOptionImpl;
  const _MenuOption._() : super._();

  @override
  String get id;
  @override
  String get menuId;
  @override
  OptionType get optionType;
  @override
  String get optionName;
  @override
  int get priceAdjustment;
  @override
  bool get isDefault;
  @override
  DateTime get createdAt;

  /// Create a copy of MenuOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuOptionImplCopyWith<_$MenuOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
