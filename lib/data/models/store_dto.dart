import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/store.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

@freezed
class StoreDto with _$StoreDto {
  const factory StoreDto({
    required String id,
    required String name,
    required String address,
    @JsonKey(name: 'detailed_address') String? detailedAddress,
    required String phone,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'opening_hours') required String openingHours,
    @JsonKey(name: 'is_open') @Default(true) bool isOpen,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _StoreDto;

  const StoreDto._();

  factory StoreDto.fromJson(Map<String, dynamic> json) => _$StoreDtoFromJson(json);

  Store toEntity() => Store(
        id: id,
        name: name,
        address: address,
        detailedAddress: detailedAddress,
        phone: phone,
        latitude: latitude,
        longitude: longitude,
        operatingHours: openingHours,
        isOpen: isOpen,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}