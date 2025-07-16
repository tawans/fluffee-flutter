// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderItem {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get menuId => throw _privateConstructorUsedError;
  Menu get menu => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get unitPrice => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  Map<String, dynamic>? get selectedOptions =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call({
    String id,
    String orderId,
    String menuId,
    Menu menu,
    int quantity,
    int unitPrice,
    int totalPrice,
    Map<String, dynamic>? selectedOptions,
    DateTime createdAt,
  });

  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
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
                      as Menu,
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

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenuCopyWith<$Res> get menu {
    return $MenuCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
    _$OrderItemImpl value,
    $Res Function(_$OrderItemImpl) then,
  ) = __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String orderId,
    String menuId,
    Menu menu,
    int quantity,
    int unitPrice,
    int totalPrice,
    Map<String, dynamic>? selectedOptions,
    DateTime createdAt,
  });

  @override
  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
    _$OrderItemImpl _value,
    $Res Function(_$OrderItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItem
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
      _$OrderItemImpl(
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
                  as Menu,
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

class _$OrderItemImpl extends _OrderItem {
  const _$OrderItemImpl({
    required this.id,
    required this.orderId,
    required this.menuId,
    required this.menu,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    final Map<String, dynamic>? selectedOptions,
    required this.createdAt,
  }) : _selectedOptions = selectedOptions,
       super._();

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String menuId;
  @override
  final Menu menu;
  @override
  final int quantity;
  @override
  final int unitPrice;
  @override
  final int totalPrice;
  final Map<String, dynamic>? _selectedOptions;
  @override
  Map<String, dynamic>? get selectedOptions {
    final value = _selectedOptions;
    if (value == null) return null;
    if (_selectedOptions is EqualUnmodifiableMapView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'OrderItem(id: $id, orderId: $orderId, menuId: $menuId, menu: $menu, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, selectedOptions: $selectedOptions, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
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

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);
}

abstract class _OrderItem extends OrderItem {
  const factory _OrderItem({
    required final String id,
    required final String orderId,
    required final String menuId,
    required final Menu menu,
    required final int quantity,
    required final int unitPrice,
    required final int totalPrice,
    final Map<String, dynamic>? selectedOptions,
    required final DateTime createdAt,
  }) = _$OrderItemImpl;
  const _OrderItem._() : super._();

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get menuId;
  @override
  Menu get menu;
  @override
  int get quantity;
  @override
  int get unitPrice;
  @override
  int get totalPrice;
  @override
  Map<String, dynamic>? get selectedOptions;
  @override
  DateTime get createdAt;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
