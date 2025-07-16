// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) {
  return _CartItemDto.fromJson(json);
}

/// @nodoc
mixin _$CartItemDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'menu_id')
  String get menuId => throw _privateConstructorUsedError;
  MenuDto get menu => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  int get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_options')
  Map<String, dynamic>? get selectedOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CartItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemDtoCopyWith<CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
    CartItemDto value,
    $Res Function(CartItemDto) then,
  ) = _$CartItemDtoCopyWithImpl<$Res, CartItemDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'menu_id') String menuId,
    MenuDto menu,
    int quantity,
    @JsonKey(name: 'unit_price') int unitPrice,
    @JsonKey(name: 'total_price') int totalPrice,
    @JsonKey(name: 'selected_options') Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });

  $MenuDtoCopyWith<$Res> get menu;
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res, $Val extends CartItemDto>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? menuId = null,
    Object? menu = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? selectedOptions = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            menuId: null == menuId
                ? _value.menuId
                : menuId // ignore: cast_nullable_to_non_nullable
                      as String,
            menu: null == menu
                ? _value.menu
                : menu // ignore: cast_nullable_to_non_nullable
                      as MenuDto,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitPrice: null == unitPrice
                ? _value.unitPrice
                : unitPrice // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPrice: null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                      as int,
            selectedOptions: freezed == selectedOptions
                ? _value.selectedOptions
                : selectedOptions // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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

  /// Create a copy of CartItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuDtoCopyWith<$Res> get menu {
    return $MenuDtoCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemDtoImplCopyWith<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  factory _$$CartItemDtoImplCopyWith(
    _$CartItemDtoImpl value,
    $Res Function(_$CartItemDtoImpl) then,
  ) = __$$CartItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'menu_id') String menuId,
    MenuDto menu,
    int quantity,
    @JsonKey(name: 'unit_price') int unitPrice,
    @JsonKey(name: 'total_price') int totalPrice,
    @JsonKey(name: 'selected_options') Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });

  @override
  $MenuDtoCopyWith<$Res> get menu;
}

/// @nodoc
class __$$CartItemDtoImplCopyWithImpl<$Res>
    extends _$CartItemDtoCopyWithImpl<$Res, _$CartItemDtoImpl>
    implements _$$CartItemDtoImplCopyWith<$Res> {
  __$$CartItemDtoImplCopyWithImpl(
    _$CartItemDtoImpl _value,
    $Res Function(_$CartItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? menuId = null,
    Object? menu = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? selectedOptions = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CartItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        menuId: null == menuId
            ? _value.menuId
            : menuId // ignore: cast_nullable_to_non_nullable
                  as String,
        menu: null == menu
            ? _value.menu
            : menu // ignore: cast_nullable_to_non_nullable
                  as MenuDto,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPrice: null == unitPrice
            ? _value.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPrice: null == totalPrice
            ? _value.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as int,
        selectedOptions: freezed == selectedOptions
            ? _value._selectedOptions
            : selectedOptions // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$CartItemDtoImpl extends _CartItemDto {
  const _$CartItemDtoImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'menu_id') required this.menuId,
    required this.menu,
    required this.quantity,
    @JsonKey(name: 'unit_price') required this.unitPrice,
    @JsonKey(name: 'total_price') required this.totalPrice,
    @JsonKey(name: 'selected_options')
    final Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : _selectedOptions = selectedOptions,
       super._();

  factory _$CartItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'menu_id')
  final String menuId;
  @override
  final MenuDto menu;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final int unitPrice;
  @override
  @JsonKey(name: 'total_price')
  final int totalPrice;
  final Map<String, dynamic>? _selectedOptions;
  @override
  @JsonKey(name: 'selected_options')
  Map<String, dynamic>? get selectedOptions {
    final value = _selectedOptions;
    if (value == null) return null;
    if (_selectedOptions is EqualUnmodifiableMapView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CartItemDto(id: $id, userId: $userId, menuId: $menuId, menu: $menu, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedOptions: $selectedOptions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.menuId, menuId) || other.menuId == menuId) &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(
              other._selectedOptions,
              _selectedOptions,
            ) &&
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
    userId,
    menuId,
    menu,
    quantity,
    unitPrice,
    totalPrice,
    const DeepCollectionEquality().hash(_selectedOptions),
    createdAt,
    updatedAt,
  );

  /// Create a copy of CartItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemDtoImplCopyWith<_$CartItemDtoImpl> get copyWith =>
      __$$CartItemDtoImplCopyWithImpl<_$CartItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemDtoImplToJson(this);
  }
}

abstract class _CartItemDto extends CartItemDto {
  const factory _CartItemDto({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'menu_id') required final String menuId,
    required final MenuDto menu,
    required final int quantity,
    @JsonKey(name: 'unit_price') required final int unitPrice,
    @JsonKey(name: 'total_price') required final int totalPrice,
    @JsonKey(name: 'selected_options')
    final Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$CartItemDtoImpl;
  const _CartItemDto._() : super._();

  factory _CartItemDto.fromJson(Map<String, dynamic> json) =
      _$CartItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'menu_id')
  String get menuId;
  @override
  MenuDto get menu;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  int get unitPrice;
  @override
  @JsonKey(name: 'total_price')
  int get totalPrice;
  @override
  @JsonKey(name: 'selected_options')
  Map<String, dynamic>? get selectedOptions;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of CartItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemDtoImplCopyWith<_$CartItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
