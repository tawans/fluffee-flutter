// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_option_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MenuOptionDto _$MenuOptionDtoFromJson(Map<String, dynamic> json) {
  return _MenuOptionDto.fromJson(json);
}

/// @nodoc
mixin _$MenuOptionDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_id')
  String get menuId => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_type')
  String get optionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_value')
  String get optionValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_price')
  int get extraPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MenuOptionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuOptionDtoCopyWith<MenuOptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOptionDtoCopyWith<$Res> {
  factory $MenuOptionDtoCopyWith(
    MenuOptionDto value,
    $Res Function(MenuOptionDto) then,
  ) = _$MenuOptionDtoCopyWithImpl<$Res, MenuOptionDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'menu_id') String menuId,
    @JsonKey(name: 'option_type') String optionType,
    @JsonKey(name: 'option_value') String optionValue,
    @JsonKey(name: 'extra_price') int extraPrice,
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'sort_order') int sortOrder,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$MenuOptionDtoCopyWithImpl<$Res, $Val extends MenuOptionDto>
    implements $MenuOptionDtoCopyWith<$Res> {
  _$MenuOptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuId = null,
    Object? optionType = null,
    Object? optionValue = null,
    Object? extraPrice = null,
    Object? isAvailable = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
                      as String,
            optionValue: null == optionValue
                ? _value.optionValue
                : optionValue // ignore: cast_nullable_to_non_nullable
                      as String,
            extraPrice: null == extraPrice
                ? _value.extraPrice
                : extraPrice // ignore: cast_nullable_to_non_nullable
                      as int,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuOptionDtoImplCopyWith<$Res>
    implements $MenuOptionDtoCopyWith<$Res> {
  factory _$$MenuOptionDtoImplCopyWith(
    _$MenuOptionDtoImpl value,
    $Res Function(_$MenuOptionDtoImpl) then,
  ) = __$$MenuOptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'menu_id') String menuId,
    @JsonKey(name: 'option_type') String optionType,
    @JsonKey(name: 'option_value') String optionValue,
    @JsonKey(name: 'extra_price') int extraPrice,
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'sort_order') int sortOrder,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$MenuOptionDtoImplCopyWithImpl<$Res>
    extends _$MenuOptionDtoCopyWithImpl<$Res, _$MenuOptionDtoImpl>
    implements _$$MenuOptionDtoImplCopyWith<$Res> {
  __$$MenuOptionDtoImplCopyWithImpl(
    _$MenuOptionDtoImpl _value,
    $Res Function(_$MenuOptionDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuId = null,
    Object? optionType = null,
    Object? optionValue = null,
    Object? extraPrice = null,
    Object? isAvailable = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$MenuOptionDtoImpl(
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
                  as String,
        optionValue: null == optionValue
            ? _value.optionValue
            : optionValue // ignore: cast_nullable_to_non_nullable
                  as String,
        extraPrice: null == extraPrice
            ? _value.extraPrice
            : extraPrice // ignore: cast_nullable_to_non_nullable
                  as int,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuOptionDtoImpl extends _MenuOptionDto {
  const _$MenuOptionDtoImpl({
    required this.id,
    @JsonKey(name: 'menu_id') required this.menuId,
    @JsonKey(name: 'option_type') required this.optionType,
    @JsonKey(name: 'option_value') required this.optionValue,
    @JsonKey(name: 'extra_price') this.extraPrice = 0,
    @JsonKey(name: 'is_available') this.isAvailable = true,
    @JsonKey(name: 'sort_order') this.sortOrder = 0,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$MenuOptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuOptionDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'menu_id')
  final String menuId;
  @override
  @JsonKey(name: 'option_type')
  final String optionType;
  @override
  @JsonKey(name: 'option_value')
  final String optionValue;
  @override
  @JsonKey(name: 'extra_price')
  final int extraPrice;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MenuOptionDto(id: $id, menuId: $menuId, optionType: $optionType, optionValue: $optionValue, extraPrice: $extraPrice, isAvailable: $isAvailable, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuOptionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.optionType, optionType) ||
                other.optionType == optionType) &&
            (identical(other.optionValue, optionValue) ||
                other.optionValue == optionValue) &&
            (identical(other.extraPrice, extraPrice) ||
                other.extraPrice == extraPrice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    menuId,
    optionType,
    optionValue,
    extraPrice,
    isAvailable,
    sortOrder,
    createdAt,
    updatedAt,
  );

  /// Create a copy of MenuOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuOptionDtoImplCopyWith<_$MenuOptionDtoImpl> get copyWith =>
      __$$MenuOptionDtoImplCopyWithImpl<_$MenuOptionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuOptionDtoImplToJson(this);
  }
}

abstract class _MenuOptionDto extends MenuOptionDto {
  const factory _MenuOptionDto({
    required final String id,
    @JsonKey(name: 'menu_id') required final String menuId,
    @JsonKey(name: 'option_type') required final String optionType,
    @JsonKey(name: 'option_value') required final String optionValue,
    @JsonKey(name: 'extra_price') final int extraPrice,
    @JsonKey(name: 'is_available') final bool isAvailable,
    @JsonKey(name: 'sort_order') final int sortOrder,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$MenuOptionDtoImpl;
  const _MenuOptionDto._() : super._();

  factory _MenuOptionDto.fromJson(Map<String, dynamic> json) =
      _$MenuOptionDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'menu_id')
  String get menuId;
  @override
  @JsonKey(name: 'option_type')
  String get optionType;
  @override
  @JsonKey(name: 'option_value')
  String get optionValue;
  @override
  @JsonKey(name: 'extra_price')
  int get extraPrice;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of MenuOptionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuOptionDtoImplCopyWith<_$MenuOptionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
