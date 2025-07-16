// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Store {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get detailedAddress => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get operatingHours => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  CongestionLevel get congestionLevel => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res, Store>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String? detailedAddress,
    String? phone,
    double latitude,
    double longitude,
    String? operatingHours,
    bool isOpen,
    bool isActive,
    CongestionLevel congestionLevel,
    bool isFavorite,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$StoreCopyWithImpl<$Res, $Val extends Store>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? detailedAddress = freezed,
    Object? phone = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? operatingHours = freezed,
    Object? isOpen = null,
    Object? isActive = null,
    Object? congestionLevel = null,
    Object? isFavorite = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            detailedAddress: freezed == detailedAddress
                ? _value.detailedAddress
                : detailedAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            operatingHours: freezed == operatingHours
                ? _value.operatingHours
                : operatingHours // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOpen: null == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            congestionLevel: null == congestionLevel
                ? _value.congestionLevel
                : congestionLevel // ignore: cast_nullable_to_non_nullable
                      as CongestionLevel,
            isFavorite: null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$StoreImplCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$$StoreImplCopyWith(
    _$StoreImpl value,
    $Res Function(_$StoreImpl) then,
  ) = __$$StoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    String? detailedAddress,
    String? phone,
    double latitude,
    double longitude,
    String? operatingHours,
    bool isOpen,
    bool isActive,
    CongestionLevel congestionLevel,
    bool isFavorite,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$StoreImplCopyWithImpl<$Res>
    extends _$StoreCopyWithImpl<$Res, _$StoreImpl>
    implements _$$StoreImplCopyWith<$Res> {
  __$$StoreImplCopyWithImpl(
    _$StoreImpl _value,
    $Res Function(_$StoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? detailedAddress = freezed,
    Object? phone = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? operatingHours = freezed,
    Object? isOpen = null,
    Object? isActive = null,
    Object? congestionLevel = null,
    Object? isFavorite = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$StoreImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        detailedAddress: freezed == detailedAddress
            ? _value.detailedAddress
            : detailedAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        operatingHours: freezed == operatingHours
            ? _value.operatingHours
            : operatingHours // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOpen: null == isOpen
            ? _value.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        congestionLevel: null == congestionLevel
            ? _value.congestionLevel
            : congestionLevel // ignore: cast_nullable_to_non_nullable
                  as CongestionLevel,
        isFavorite: null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
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

class _$StoreImpl extends _Store {
  const _$StoreImpl({
    required this.id,
    required this.name,
    required this.address,
    this.detailedAddress,
    this.phone,
    required this.latitude,
    required this.longitude,
    this.operatingHours,
    this.isOpen = true,
    this.isActive = true,
    this.congestionLevel = CongestionLevel.medium,
    this.isFavorite = false,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String? detailedAddress;
  @override
  final String? phone;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? operatingHours;
  @override
  @JsonKey()
  final bool isOpen;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final CongestionLevel congestionLevel;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Store(id: $id, name: $name, address: $address, detailedAddress: $detailedAddress, phone: $phone, latitude: $latitude, longitude: $longitude, operatingHours: $operatingHours, isOpen: $isOpen, isActive: $isActive, congestionLevel: $congestionLevel, isFavorite: $isFavorite, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.detailedAddress, detailedAddress) ||
                other.detailedAddress == detailedAddress) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.operatingHours, operatingHours) ||
                other.operatingHours == operatingHours) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.congestionLevel, congestionLevel) ||
                other.congestionLevel == congestionLevel) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    address,
    detailedAddress,
    phone,
    latitude,
    longitude,
    operatingHours,
    isOpen,
    isActive,
    congestionLevel,
    isFavorite,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      __$$StoreImplCopyWithImpl<_$StoreImpl>(this, _$identity);
}

abstract class _Store extends Store {
  const factory _Store({
    required final String id,
    required final String name,
    required final String address,
    final String? detailedAddress,
    final String? phone,
    required final double latitude,
    required final double longitude,
    final String? operatingHours,
    final bool isOpen,
    final bool isActive,
    final CongestionLevel congestionLevel,
    final bool isFavorite,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$StoreImpl;
  const _Store._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String? get detailedAddress;
  @override
  String? get phone;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get operatingHours;
  @override
  bool get isOpen;
  @override
  bool get isActive;
  @override
  CongestionLevel get congestionLevel;
  @override
  bool get isFavorite;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Store
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreImplCopyWith<_$StoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
