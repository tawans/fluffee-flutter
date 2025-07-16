import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

enum CongestionLevel {
  low,
  medium,
  high,
}

@freezed
class Store with _$Store {
  const factory Store({
    required String id,
    required String name,
    required String address,
    String? detailedAddress,
    String? phone,
    required double latitude,
    required double longitude,
    String? operatingHours,
    @Default(true) bool isOpen,
    @Default(true) bool isActive,
    @Default(CongestionLevel.medium) CongestionLevel congestionLevel,
    @Default(false) bool isFavorite,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Store;

  const Store._();

  String get congestionText {
    switch (congestionLevel) {
      case CongestionLevel.low:
        return '여유';
      case CongestionLevel.medium:
        return '보통';
      case CongestionLevel.high:
        return '혼잡';
    }
  }
  
  String get statusText {
    return isOpen ? '영업중' : '영업종료';
  }
}