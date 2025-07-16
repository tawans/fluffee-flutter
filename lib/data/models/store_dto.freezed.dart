// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) {
  return _StoreDto.fromJson(json);
}

/// @nodoc
mixin _$StoreDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'detailed_address')
  String? get detailedAddress => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  String get openingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_open')
  bool get isOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this StoreDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreDtoCopyWith<StoreDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDtoCopyWith<$Res> {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) then) =
      _$StoreDtoCopyWithImpl<$Res, StoreDto>;
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    @JsonKey(name: 'detailed_address') String? detailedAddress,
    String phone,
    double latitude,
    double longitude,
    @JsonKey(name: 'opening_hours') String openingHours,
    @JsonKey(name: 'is_open') bool isOpen,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$StoreDtoCopyWithImpl<$Res, $Val extends StoreDto>
    implements $StoreDtoCopyWith<$Res> {
  _$StoreDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? detailedAddress = freezed,
    Object? phone = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? openingHours = null,
    Object? isOpen = null,
    Object? isActive = null,
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
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            openingHours: null == openingHours
                ? _value.openingHours
                : openingHours // ignore: cast_nullable_to_non_nullable
                      as String,
            isOpen: null == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
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
abstract class _$$StoreDtoImplCopyWith<$Res>
    implements $StoreDtoCopyWith<$Res> {
  factory _$$StoreDtoImplCopyWith(
    _$StoreDtoImpl value,
    $Res Function(_$StoreDtoImpl) then,
  ) = __$$StoreDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String address,
    @JsonKey(name: 'detailed_address') String? detailedAddress,
    String phone,
    double latitude,
    double longitude,
    @JsonKey(name: 'opening_hours') String openingHours,
    @JsonKey(name: 'is_open') bool isOpen,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$StoreDtoImplCopyWithImpl<$Res>
    extends _$StoreDtoCopyWithImpl<$Res, _$StoreDtoImpl>
    implements _$$StoreDtoImplCopyWith<$Res> {
  __$$StoreDtoImplCopyWithImpl(
    _$StoreDtoImpl _value,
    $Res Function(_$StoreDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoreDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? detailedAddress = freezed,
    Object? phone = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? openingHours = null,
    Object? isOpen = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$StoreDtoImpl(
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
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        openingHours: null == openingHours
            ? _value.openingHours
            : openingHours // ignore: cast_nullable_to_non_nullable
                  as String,
        isOpen: null == isOpen
            ? _value.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$StoreDtoImpl extends _StoreDto {
  const _$StoreDtoImpl({
    required this.id,
    required this.name,
    required this.address,
    @JsonKey(name: 'detailed_address') this.detailedAddress,
    required this.phone,
    required this.latitude,
    required this.longitude,
    @JsonKey(name: 'opening_hours') required this.openingHours,
    @JsonKey(name: 'is_open') this.isOpen = true,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : super._();

  factory _$StoreDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'detailed_address')
  final String? detailedAddress;
  @override
  final String phone;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'opening_hours')
  final String openingHours;
  @override
  @JsonKey(name: 'is_open')
  final bool isOpen;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'StoreDto(id: $id, name: $name, address: $address, detailedAddress: $detailedAddress, phone: $phone, latitude: $latitude, longitude: $longitude, openingHours: $openingHours, isOpen: $isOpen, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreDtoImpl &&
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
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
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
    name,
    address,
    detailedAddress,
    phone,
    latitude,
    longitude,
    openingHours,
    isOpen,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of StoreDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreDtoImplCopyWith<_$StoreDtoImpl> get copyWith =>
      __$$StoreDtoImplCopyWithImpl<_$StoreDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreDtoImplToJson(this);
  }
}

abstract class _StoreDto extends StoreDto {
  const factory _StoreDto({
    required final String id,
    required final String name,
    required final String address,
    @JsonKey(name: 'detailed_address') final String? detailedAddress,
    required final String phone,
    required final double latitude,
    required final double longitude,
    @JsonKey(name: 'opening_hours') required final String openingHours,
    @JsonKey(name: 'is_open') final bool isOpen,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$StoreDtoImpl;
  const _StoreDto._() : super._();

  factory _StoreDto.fromJson(Map<String, dynamic> json) =
      _$StoreDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'detailed_address')
  String? get detailedAddress;
  @override
  String get phone;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'opening_hours')
  String get openingHours;
  @override
  @JsonKey(name: 'is_open')
  bool get isOpen;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of StoreDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreDtoImplCopyWith<_$StoreDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
