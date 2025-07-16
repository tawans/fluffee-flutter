// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) {
  return _MenuDto.fromJson(json);
}

/// @nodoc
mixin _$MenuDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  String get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_en')
  String? get nameEn => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_popular')
  bool get isPopular => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_recommended')
  bool get isRecommended => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  List<MenuOptionDto> get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MenuDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuDtoCopyWith<MenuDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuDtoCopyWith<$Res> {
  factory $MenuDtoCopyWith(MenuDto value, $Res Function(MenuDto) then) =
      _$MenuDtoCopyWithImpl<$Res, MenuDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'category_id') String categoryId,
    String name,
    @JsonKey(name: 'name_en') String? nameEn,
    String? description,
    int price,
    int? calories,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_popular') bool isPopular,
    @JsonKey(name: 'is_recommended') bool isRecommended,
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'sort_order') int sortOrder,
    List<MenuOptionDto> options,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$MenuDtoCopyWithImpl<$Res, $Val extends MenuDto>
    implements $MenuDtoCopyWith<$Res> {
  _$MenuDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? name = null,
    Object? nameEn = freezed,
    Object? description = freezed,
    Object? price = null,
    Object? calories = freezed,
    Object? imageUrl = freezed,
    Object? isPopular = null,
    Object? isRecommended = null,
    Object? isAvailable = null,
    Object? sortOrder = null,
    Object? options = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEn: freezed == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int,
            calories: freezed == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPopular: null == isPopular
                ? _value.isPopular
                : isPopular // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRecommended: null == isRecommended
                ? _value.isRecommended
                : isRecommended // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<MenuOptionDto>,
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
abstract class _$$MenuDtoImplCopyWith<$Res> implements $MenuDtoCopyWith<$Res> {
  factory _$$MenuDtoImplCopyWith(
    _$MenuDtoImpl value,
    $Res Function(_$MenuDtoImpl) then,
  ) = __$$MenuDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'category_id') String categoryId,
    String name,
    @JsonKey(name: 'name_en') String? nameEn,
    String? description,
    int price,
    int? calories,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_popular') bool isPopular,
    @JsonKey(name: 'is_recommended') bool isRecommended,
    @JsonKey(name: 'is_available') bool isAvailable,
    @JsonKey(name: 'sort_order') int sortOrder,
    List<MenuOptionDto> options,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$MenuDtoImplCopyWithImpl<$Res>
    extends _$MenuDtoCopyWithImpl<$Res, _$MenuDtoImpl>
    implements _$$MenuDtoImplCopyWith<$Res> {
  __$$MenuDtoImplCopyWithImpl(
    _$MenuDtoImpl _value,
    $Res Function(_$MenuDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = null,
    Object? name = null,
    Object? nameEn = freezed,
    Object? description = freezed,
    Object? price = null,
    Object? calories = freezed,
    Object? imageUrl = freezed,
    Object? isPopular = null,
    Object? isRecommended = null,
    Object? isAvailable = null,
    Object? sortOrder = null,
    Object? options = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$MenuDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: freezed == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int,
        calories: freezed == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPopular: null == isPopular
            ? _value.isPopular
            : isPopular // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRecommended: null == isRecommended
            ? _value.isRecommended
            : isRecommended // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<MenuOptionDto>,
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
class _$MenuDtoImpl extends _MenuDto {
  const _$MenuDtoImpl({
    required this.id,
    @JsonKey(name: 'category_id') required this.categoryId,
    required this.name,
    @JsonKey(name: 'name_en') this.nameEn,
    this.description,
    required this.price,
    this.calories,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'is_popular') this.isPopular = false,
    @JsonKey(name: 'is_recommended') this.isRecommended = false,
    @JsonKey(name: 'is_available') this.isAvailable = true,
    @JsonKey(name: 'sort_order') this.sortOrder = 0,
    final List<MenuOptionDto> options = const [],
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  }) : _options = options,
       super._();

  factory _$MenuDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  final String name;
  @override
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @override
  final String? description;
  @override
  final int price;
  @override
  final int? calories;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'is_popular')
  final bool isPopular;
  @override
  @JsonKey(name: 'is_recommended')
  final bool isRecommended;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  final List<MenuOptionDto> _options;
  @override
  @JsonKey()
  List<MenuOptionDto> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MenuDto(id: $id, categoryId: $categoryId, name: $name, nameEn: $nameEn, description: $description, price: $price, calories: $calories, imageUrl: $imageUrl, isPopular: $isPopular, isRecommended: $isRecommended, isAvailable: $isAvailable, sortOrder: $sortOrder, options: $options, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
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
    categoryId,
    name,
    nameEn,
    description,
    price,
    calories,
    imageUrl,
    isPopular,
    isRecommended,
    isAvailable,
    sortOrder,
    const DeepCollectionEquality().hash(_options),
    createdAt,
    updatedAt,
  );

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuDtoImplCopyWith<_$MenuDtoImpl> get copyWith =>
      __$$MenuDtoImplCopyWithImpl<_$MenuDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuDtoImplToJson(this);
  }
}

abstract class _MenuDto extends MenuDto {
  const factory _MenuDto({
    required final String id,
    @JsonKey(name: 'category_id') required final String categoryId,
    required final String name,
    @JsonKey(name: 'name_en') final String? nameEn,
    final String? description,
    required final int price,
    final int? calories,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'is_popular') final bool isPopular,
    @JsonKey(name: 'is_recommended') final bool isRecommended,
    @JsonKey(name: 'is_available') final bool isAvailable,
    @JsonKey(name: 'sort_order') final int sortOrder,
    final List<MenuOptionDto> options,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$MenuDtoImpl;
  const _MenuDto._() : super._();

  factory _MenuDto.fromJson(Map<String, dynamic> json) = _$MenuDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'category_id')
  String get categoryId;
  @override
  String get name;
  @override
  @JsonKey(name: 'name_en')
  String? get nameEn;
  @override
  String? get description;
  @override
  int get price;
  @override
  int? get calories;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'is_popular')
  bool get isPopular;
  @override
  @JsonKey(name: 'is_recommended')
  bool get isRecommended;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  List<MenuOptionDto> get options;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of MenuDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuDtoImplCopyWith<_$MenuDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
