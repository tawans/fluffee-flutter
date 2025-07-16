import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/exceptions.dart';
import '../../models/store_dto.dart';
import 'supabase_client.dart';

abstract class StoreRemoteDataSource {
  Future<List<StoreDto>> getNearbyStores({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  });
  Future<StoreDto> getStoreById(String storeId);
  Future<List<StoreDto>> getFavoriteStores(String userId);
  Future<void> toggleFavoriteStore({
    required String userId,
    required String storeId,
  });
  Future<List<StoreDto>> getAllStores();
}

@LazySingleton(as: StoreRemoteDataSource)
class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final SupabaseClientWrapper _supabaseClient;

  StoreRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<StoreDto>> getNearbyStores({
    required double latitude,
    required double longitude,
    double radiusKm = 10.0,
  }) async {
    try {
      final response = await _supabaseClient.client.rpc('get_nearby_stores', params: {
        'user_lat': latitude,
        'user_lng': longitude,
        'radius_km': radiusKm,
      });

      return (response as List)
          .map((json) => StoreDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<StoreDto> getStoreById(String storeId) async {
    try {
      final response = await _supabaseClient.client
          .from('stores')
          .select()
          .eq('id', storeId)
          .eq('is_active', true)
          .single();

      return StoreDto.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<StoreDto>> getFavoriteStores(String userId) async {
    try {
      final response = await _supabaseClient.client
          .from('user_favorite_stores')
          .select('''
            stores(*)
          ''')
          .eq('user_id', userId);

      return (response as List)
          .map((json) => StoreDto.fromJson(json['stores']))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> toggleFavoriteStore({
    required String userId,
    required String storeId,
  }) async {
    try {
      final existing = await _supabaseClient.client
          .from('user_favorite_stores')
          .select()
          .eq('user_id', userId)
          .eq('store_id', storeId)
          .maybeSingle();

      if (existing != null) {
        await _supabaseClient.client
            .from('user_favorite_stores')
            .delete()
            .eq('user_id', userId)
            .eq('store_id', storeId);
      } else {
        await _supabaseClient.client
            .from('user_favorite_stores')
            .insert({
          'user_id': userId,
          'store_id': storeId,
        });
      }
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<StoreDto>> getAllStores() async {
    try {
      final response = await _supabaseClient.client
          .from('stores')
          .select()
          .eq('is_active', true)
          .order('name');

      return (response as List)
          .map((json) => StoreDto.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}