import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

/// 위치 정보
class LocationData {
  final double latitude;
  final double longitude;
  final double? accuracy;
  final DateTime timestamp;

  const LocationData({
    required this.latitude,
    required this.longitude,
    this.accuracy,
    required this.timestamp,
  });

  @override
  String toString() {
    return 'LocationData(lat: $latitude, lng: $longitude, accuracy: $accuracy)';
  }
}

/// 위치 서비스
/// 사용자의 현재 위치를 가져오고 권한을 관리합니다.
class LocationService {
  static const double _defaultLatitude = 37.5665; // 서울 시청
  static const double _defaultLongitude = 126.9780;
  
  /// 위치 권한 확인 및 요청
  Future<Either<Failure, bool>> checkAndRequestPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Left(Failure.location('위치 서비스가 비활성화되어 있습니다. 설정에서 위치 서비스를 활성화해주세요.'));
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Left(Failure.location('위치 권한이 거부되었습니다.'));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Left(Failure.location('위치 권한이 영구적으로 거부되었습니다. 설정에서 권한을 허용해주세요.'));
      }

      return const Right(true);
    } catch (e) {
      return Left(Failure.location('위치 권한 확인 중 오류가 발생했습니다: $e'));
    }
  }

  /// 현재 위치 가져오기
  Future<Either<Failure, LocationData>> getCurrentLocation() async {
    try {
      final permissionResult = await checkAndRequestPermission();
      if (permissionResult.isLeft()) {
        // 권한이 없으면 기본 위치 반환 (서울 시청)
        return Right(LocationData(
          latitude: _defaultLatitude,
          longitude: _defaultLongitude,
          timestamp: DateTime.now(),
        ));
      }

      const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );

      final position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      return Right(LocationData(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        timestamp: DateTime.now(),
      ));
    } catch (e) {
      // 오류 발생 시 기본 위치 반환
      return Right(LocationData(
        latitude: _defaultLatitude,
        longitude: _defaultLongitude,
        timestamp: DateTime.now(),
      ));
    }
  }

  /// 두 지점 간의 거리 계산 (킬로미터)
  double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    ) / 1000; // 미터를 킬로미터로 변환
  }

  /// 위치 권한 설정 페이지 열기
  Future<bool> openLocationSettings() async {
    try {
      return await Geolocator.openLocationSettings();
    } catch (e) {
      return false;
    }
  }

  /// 앱 설정 페이지 열기
  Future<bool> openAppSettings() async {
    try {
      return await Geolocator.openAppSettings();
    } catch (e) {
      return false;
    }
  }

  /// 위치 스트림 시작 (실시간 위치 추적)
  Stream<LocationData> getLocationStream() {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // 10미터 이상 이동시에만 업데이트
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings)
        .map((position) => LocationData(
              latitude: position.latitude,
              longitude: position.longitude,
              accuracy: position.accuracy,
              timestamp: DateTime.now(),
            ));
  }

  /// 기본 위치 (서울 시청) 반환
  LocationData getDefaultLocation() {
    return LocationData(
      latitude: _defaultLatitude,
      longitude: _defaultLongitude,
      timestamp: DateTime.now(),
    );
  }

  /// 위치가 유효한지 확인
  bool isValidLocation(double latitude, double longitude) {
    return latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180;
  }

  /// 거리 텍스트 포맷팅
  String formatDistance(double distanceInKm) {
    if (distanceInKm < 1) {
      return '${(distanceInKm * 1000).round()}m';
    } else if (distanceInKm < 10) {
      return '${distanceInKm.toStringAsFixed(1)}km';
    } else {
      return '${distanceInKm.round()}km';
    }
  }

  /// 주소로부터 좌표 가져오기 (Geocoding - 추후 구현 가능)
  // Future<Either<Failure, LocationData>> getLocationFromAddress(String address) async {
  //   // Geocoding API를 사용하여 주소를 좌표로 변환
  //   // 현재는 미구현
  // }

  /// 좌표로부터 주소 가져오기 (Reverse Geocoding - 추후 구현 가능)
  // Future<Either<Failure, String>> getAddressFromLocation(double lat, double lng) async {
  //   // Reverse Geocoding API를 사용하여 좌표를 주소로 변환
  //   // 현재는 미구현
  // }
}