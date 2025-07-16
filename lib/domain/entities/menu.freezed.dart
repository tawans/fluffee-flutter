// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Menu {
  String get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;
  bool get isRecommended => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  List<MenuOption> get options => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call({
    String id,
    String categoryId,
    String name,
    String? nameEn,
    String? description,
    int price,
    int? calories,
    String? imageUrl,
    bool isPopular,
    bool isRecommended,
    bool isAvailable,
    int sortOrder,
    List<MenuOption> options,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Menu
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
                      as List<MenuOption>,
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
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
    _$MenuImpl value,
    $Res Function(_$MenuImpl) then,
  ) = __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String categoryId,
    String name,
    String? nameEn,
    String? description,
    int price,
    int? calories,
    String? imageUrl,
    bool isPopular,
    bool isRecommended,
    bool isAvailable,
    int sortOrder,
    List<MenuOption> options,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
    : super(_value, _then);

  /// Create a copy of Menu
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
      _$MenuImpl(
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
                  as List<MenuOption>,
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

class _$MenuImpl extends _Menu {
  const _$MenuImpl({
    required this.id,
    required this.categoryId,
    required this.name,
    this.nameEn,
    this.description,
    required this.price,
    this.calories,
    this.imageUrl,
    this.isPopular = false,
    this.isRecommended = false,
    this.isAvailable = true,
    this.sortOrder = 0,
    final List<MenuOption> options = const [],
    required this.createdAt,
    required this.updatedAt,
  }) : _options = options,
       super._();

  @override
  final String id;
  @override
  final String categoryId;
  @override
  final String name;
  @override
  final String? nameEn;
  @override
  final String? description;
  @override
  final int price;
  @override
  final int? calories;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final bool isPopular;
  @override
  @JsonKey()
  final bool isRecommended;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final int sortOrder;
  final List<MenuOption> _options;
  @override
  @JsonKey()
  List<MenuOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Menu(id: $id, categoryId: $categoryId, name: $name, nameEn: $nameEn, description: $description, price: $price, calories: $calories, imageUrl: $imageUrl, isPopular: $isPopular, isRecommended: $isRecommended, isAvailable: $isAvailable, sortOrder: $sortOrder, options: $options, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
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

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);
}

abstract class _Menu extends Menu {
  const factory _Menu({
    required final String id,
    required final String categoryId,
    required final String name,
    final String? nameEn,
    final String? description,
    required final int price,
    final int? calories,
    final String? imageUrl,
    final bool isPopular,
    final bool isRecommended,
    final bool isAvailable,
    final int sortOrder,
    final List<MenuOption> options,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$MenuImpl;
  const _Menu._() : super._();

  @override
  String get id;
  @override
  String get categoryId;
  @override
  String get name;
  @override
  String? get nameEn;
  @override
  String? get description;
  @override
  int get price;
  @override
  int? get calories;
  @override
  String? get imageUrl;
  @override
  bool get isPopular;
  @override
  bool get isRecommended;
  @override
  bool get isAvailable;
  @override
  int get sortOrder;
  @override
  List<MenuOption> get options;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
