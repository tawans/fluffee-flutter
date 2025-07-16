// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) {
  return _OrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderItemDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
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

  /// Serializes this OrderItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemDtoCopyWith<OrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemDtoCopyWith<$Res> {
  factory $OrderItemDtoCopyWith(
    OrderItemDto value,
    $Res Function(OrderItemDto) then,
  ) = _$OrderItemDtoCopyWithImpl<$Res, OrderItemDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_id') String orderId,
    @JsonKey(name: 'menu_id') String menuId,
    MenuDto menu,
    int quantity,
    @JsonKey(name: 'unit_price') int unitPrice,
    @JsonKey(name: 'total_price') int totalPrice,
    @JsonKey(name: 'selected_options') Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });

  $MenuDtoCopyWith<$Res> get menu;
}

/// @nodoc
class _$OrderItemDtoCopyWithImpl<$Res, $Val extends OrderItemDto>
    implements $OrderItemDtoCopyWith<$Res> {
  _$OrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? menuId = null,
    Object? menu = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? selectedOptions = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }

  /// Create a copy of OrderItemDto
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
abstract class _$$OrderItemDtoImplCopyWith<$Res>
    implements $OrderItemDtoCopyWith<$Res> {
  factory _$$OrderItemDtoImplCopyWith(
    _$OrderItemDtoImpl value,
    $Res Function(_$OrderItemDtoImpl) then,
  ) = __$$OrderItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_id') String orderId,
    @JsonKey(name: 'menu_id') String menuId,
    MenuDto menu,
    int quantity,
    @JsonKey(name: 'unit_price') int unitPrice,
    @JsonKey(name: 'total_price') int totalPrice,
    @JsonKey(name: 'selected_options') Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });

  @override
  $MenuDtoCopyWith<$Res> get menu;
}

/// @nodoc
class __$$OrderItemDtoImplCopyWithImpl<$Res>
    extends _$OrderItemDtoCopyWithImpl<$Res, _$OrderItemDtoImpl>
    implements _$$OrderItemDtoImplCopyWith<$Res> {
  __$$OrderItemDtoImplCopyWithImpl(
    _$OrderItemDtoImpl _value,
    $Res Function(_$OrderItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? menuId = null,
    Object? menu = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? selectedOptions = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$OrderItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemDtoImpl extends _OrderItemDto {
  const _$OrderItemDtoImpl({
    required this.id,
    @JsonKey(name: 'order_id') required this.orderId,
    @JsonKey(name: 'menu_id') required this.menuId,
    required this.menu,
    required this.quantity,
    @JsonKey(name: 'unit_price') required this.unitPrice,
    @JsonKey(name: 'total_price') required this.totalPrice,
    @JsonKey(name: 'selected_options')
    final Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') required this.createdAt,
  }) : _selectedOptions = selectedOptions,
       super._();

  factory _$OrderItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
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
  String toString() {
    return 'OrderItemDto(id: $id, orderId: $orderId, menuId: $menuId, menu: $menu, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedOptions: $selectedOptions, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
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
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderId,
    menuId,
    menu,
    quantity,
    unitPrice,
    totalPrice,
    const DeepCollectionEquality().hash(_selectedOptions),
    createdAt,
  );

  /// Create a copy of OrderItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemDtoImplCopyWith<_$OrderItemDtoImpl> get copyWith =>
      __$$OrderItemDtoImplCopyWithImpl<_$OrderItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemDtoImplToJson(this);
  }
}

abstract class _OrderItemDto extends OrderItemDto {
  const factory _OrderItemDto({
    required final String id,
    @JsonKey(name: 'order_id') required final String orderId,
    @JsonKey(name: 'menu_id') required final String menuId,
    required final MenuDto menu,
    required final int quantity,
    @JsonKey(name: 'unit_price') required final int unitPrice,
    @JsonKey(name: 'total_price') required final int totalPrice,
    @JsonKey(name: 'selected_options')
    final Map<String, dynamic>? selectedOptions,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$OrderItemDtoImpl;
  const _OrderItemDto._() : super._();

  factory _OrderItemDto.fromJson(Map<String, dynamic> json) =
      _$OrderItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
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

  /// Create a copy of OrderItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemDtoImplCopyWith<_$OrderItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
