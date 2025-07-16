import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

import '../../../core/errors/exceptions.dart';
import '../../models/user_dto.dart';
import 'supabase_client.dart';

abstract class AuthRemoteDataSource {
  Future<UserDto?> getCurrentUser();
  Future<UserDto> signInWithEmail({
    required String email,
    required String password,
  });
  Future<UserDto> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });
  Future<void> signOut();
  Future<UserDto> updateProfile({
    String? name,
    String? phone,
    String? profileImageUrl,
  });
  Stream<UserDto?> get authStateChanges;
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClientWrapper _supabaseClient;

  AuthRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<UserDto?> getCurrentUser() async {
    try {
      final user = _supabaseClient.client.auth.currentUser;
      if (user == null) return null;

      final response = await _supabaseClient.client
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      return UserDto.fromJson({
        'id': user.id,
        'email': user.email ?? '',
        ...response,
      });
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserDto> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const AuthException('로그인에 실패했습니다.');
      }

      final user = await getCurrentUser();
      if (user == null) {
        throw const AuthException('사용자 정보를 가져올 수 없습니다.');
      }

      return user;
    } on AuthException {
      rethrow;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<UserDto> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _supabaseClient.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const AuthException('회원가입에 실패했습니다.');
      }

      await _supabaseClient.client.from('profiles').insert({
        'id': response.user!.id,
        'name': name,
        'email': email,
      });

      final user = await getCurrentUser();
      if (user == null) {
        throw const AuthException('사용자 정보를 가져올 수 없습니다.');
      }

      return user;
    } on AuthException {
      rethrow;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabaseClient.client.auth.signOut();
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<UserDto> updateProfile({
    String? name,
    String? phone,
    String? profileImageUrl,
  }) async {
    try {
      final user = _supabaseClient.client.auth.currentUser;
      if (user == null) {
        throw const AuthException('로그인이 필요합니다.');
      }

      final updateData = <String, dynamic>{};
      if (name != null) updateData['name'] = name;
      if (phone != null) updateData['phone'] = phone;
      if (profileImageUrl != null) updateData['profile_image_url'] = profileImageUrl;

      if (updateData.isNotEmpty) {
        updateData['updated_at'] = DateTime.now().toIso8601String();
        
        await _supabaseClient.client
            .from('profiles')
            .update(updateData)
            .eq('id', user.id);
      }

      final updatedUser = await getCurrentUser();
      if (updatedUser == null) {
        throw const AuthException('업데이트된 사용자 정보를 가져올 수 없습니다.');
      }

      return updatedUser;
    } on AuthException {
      rethrow;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Stream<UserDto?> get authStateChanges {
    return _supabaseClient.client.auth.onAuthStateChange.asyncMap((event) async {
      if (event.session?.user != null) {
        return await getCurrentUser();
      }
      return null;
    });
  }
}