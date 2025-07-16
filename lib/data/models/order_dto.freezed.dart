// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) {
  return _OrderDto.fromJson(json);
}

/// @nodoc
mixin _$OrderDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_id')
  String get storeId => throw _privateConstructorUsedError;
  StoreDto get store => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'status',
    fromJson: _orderStatusFromJson,
    toJson: _orderStatusToJson,
  )
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  int get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_time')
  DateTime? get pickupTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<OrderItemDto> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDtoCopyWith<OrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDtoCopyWith<$Res> {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) then) =
      _$OrderDtoCopyWithImpl<$Res, OrderDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'store_id') String storeId,
    StoreDto store,
    @JsonKey(name: 'order_number') String orderNumber,
    @JsonKey(
      name: 'status',
      fromJson: _orderStatusFromJson,
      toJson: _orderStatusToJson,
    )
    OrderStatus status,
    @JsonKey(name: 'total_amount') int totalAmount,
    @JsonKey(name: 'pickup_time') DateTime? pickupTime,
    String? notes,
    List<OrderItemDto> items,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });

  $StoreDtoCopyWith<$Res> get store;
}

/// @nodoc
class _$OrderDtoCopyWithImpl<$Res, $Val extends OrderDto>
    implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? storeId = null,
    Object? store = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? pickupTime = freezed,
    Object? notes = freezed,
    Object? items = null,
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
            storeId: null == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                      as String,
            store: null == store
                ? _value.store
                : store // ignore: cast_nullable_to_non_nullable
                      as StoreDto,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OrderStatus,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as int,
            pickupTime: freezed == pickupTime
                ? _value.pickupTime
                : pickupTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemDto>,
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

  /// Create a copy of OrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoreDtoCopyWith<$Res> get store {
    return $StoreDtoCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDtoImplCopyWith<$Res>
    implements $OrderDtoCopyWith<$Res> {
  factory _$$OrderDtoImplCopyWith(
    _$OrderDtoImpl value,
    $Res Function(_$OrderDtoImpl) then,
  ) = __$$OrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'store_id') String storeId,
    StoreDto store,
    @JsonKey(name: 'order_number') String orderNumber,
    @JsonKey(
      name: 'status',
      fromJson: _orderStatusFromJson,
      toJson: _orderStatusToJson,
    )
    OrderStatus status,
    @JsonKey(name: 'total_amount') int totalAmount,
    @JsonKey(name: 'pickup_time') DateTime? pickupTime,
    String? notes,
    List<OrderItemDto> items,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });

  @override
  $StoreDtoCopyWith<$Res> get store;
}

/// @nodoc
class __$$OrderDtoImplCopyWithImpl<$Res>
    extends _$OrderDtoCopyWithImpl<$Res, _$OrderDtoImpl>
    implements _$$OrderDtoImplCopyWith<$Res> {
  __$$OrderDtoImplCopyWithImpl(
    _$OrderDtoImpl _value,
    $Res Function(_$OrderDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? storeId = null,
    Object? store = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? pickupTime = freezed,
    Object? notes = freezed,
    Object? items = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$OrderDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        storeId: null == storeId
            ? _value.storeId
            : storeId // ignore: cast_nullable_to_non_nullable
                  as String,
        store: null == store
            ? _value.store
            : store // ignore: cast_nullable_to_non_nullable
                  as StoreDto,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrderStatus,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as int,
        pickupTime: freezed == pickupTime
            ? _value.pickupTime
            : pickupTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemDto>,
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
class _$OrderDtoImpl extends _OrderDto {
  const _$OrderDtoImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'store_id') required this.storeId,
    required this.store,
    @JsonKey(name: 'order_number') required this.orderNumber,
    @JsonKey(
      name: 'status',
      fromJson: _orderStatusFromJson,
      toJson: _orderStatusToJson,
    )
    this.status = OrderStatus.received,
    @JsonKey(name: 'total_amount') required this.totalAmount,
    @JsonKey(name: 'pickup_time') this.pickupTime,
    this.notes,
    final List<OrderItemDto> items = const [],
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : _items = items,
       super._();

  factory _$OrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'store_id')
  final String storeId;
  @override
  final StoreDto store;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(
    name: 'status',
    fromJson: _orderStatusFromJson,
    toJson: _orderStatusToJson,
  )
  final OrderStatus status;
  @override
  @JsonKey(name: 'total_amount')
  final int totalAmount;
  @override
  @JsonKey(name: 'pickup_time')
  final DateTime? pickupTime;
  @override
  final String? notes;
  final List<OrderItemDto> _items;
  @override
  @JsonKey()
  List<OrderItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'OrderDto(id: $id, userId: $userId, storeId: $storeId, store: $store, orderNumber: $orderNumber, status: $status, totalAmount: $totalAmount, pickupTime: $pickupTime, notes: $notes, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
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
    storeId,
    store,
    orderNumber,
    status,
    totalAmount,
    pickupTime,
    notes,
    const DeepCollectionEquality().hash(_items),
    createdAt,
    updatedAt,
  );

  /// Create a copy of OrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDtoImplCopyWith<_$OrderDtoImpl> get copyWith =>
      __$$OrderDtoImplCopyWithImpl<_$OrderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDtoImplToJson(this);
  }
}

abstract class _OrderDto extends OrderDto {
  const factory _OrderDto({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'store_id') required final String storeId,
    required final StoreDto store,
    @JsonKey(name: 'order_number') required final String orderNumber,
    @JsonKey(
      name: 'status',
      fromJson: _orderStatusFromJson,
      toJson: _orderStatusToJson,
    )
    final OrderStatus status,
    @JsonKey(name: 'total_amount') required final int totalAmount,
    @JsonKey(name: 'pickup_time') final DateTime? pickupTime,
    final String? notes,
    final List<OrderItemDto> items,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$OrderDtoImpl;
  const _OrderDto._() : super._();

  factory _OrderDto.fromJson(Map<String, dynamic> json) =
      _$OrderDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'store_id')
  String get storeId;
  @override
  StoreDto get store;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(
    name: 'status',
    fromJson: _orderStatusFromJson,
    toJson: _orderStatusToJson,
  )
  OrderStatus get status;
  @override
  @JsonKey(name: 'total_amount')
  int get totalAmount;
  @override
  @JsonKey(name: 'pickup_time')
  DateTime? get pickupTime;
  @override
  String? get notes;
  @override
  List<OrderItemDto> get items;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of OrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDtoImplCopyWith<_$OrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
