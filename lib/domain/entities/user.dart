import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? phone,
    String? profileImageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  const User._();

  String get displayName => name.isNotEmpty ? name : email.split('@').first;
  
  bool get hasProfileImage => profileImageUrl != null && profileImageUrl!.isNotEmpty;
  
  bool get hasPhone => phone != null && phone!.isNotEmpty;
}