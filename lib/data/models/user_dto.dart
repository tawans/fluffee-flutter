import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String email,
    required String name,
    String? phone,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  User toEntity() => User(
        id: id,
        email: email,
        name: name,
        phone: phone,
        profileImageUrl: profileImageUrl,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}