// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../data/datasource/remote/auth_remote_data_source.dart' as _i519;
import '../data/datasource/remote/cart_remote_data_source.dart' as _i64;
import '../data/datasource/remote/menu_remote_data_source.dart' as _i376;
import '../data/datasource/remote/order_remote_data_source.dart' as _i33;
import '../data/datasource/remote/store_remote_data_source.dart' as _i650;
import '../data/datasource/remote/supabase_client.dart' as _i669;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/cart_repository_impl.dart' as _i47;
import '../data/repository/menu_repository_impl.dart' as _i247;
import '../data/repository/order_repository_impl.dart' as _i642;
import '../data/repository/store_repository_impl.dart' as _i4;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../domain/repositories/cart_repository.dart' as _i463;
import '../domain/repositories/menu_repository.dart' as _i997;
import '../domain/repositories/order_repository.dart' as _i201;
import '../domain/repositories/store_repository.dart' as _i439;
import 'injectable_module.dart' as _i109;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectableModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i454.SupabaseClient>(
      () => injectableModule.supabaseClient,
    );
    gh.lazySingletonAsync<_i669.SupabaseClientWrapper>(
      () => _i669.SupabaseClientWrapper.create(),
    );
    gh.lazySingletonAsync<_i519.AuthRemoteDataSource>(
      () async => _i519.AuthRemoteDataSourceImpl(
        await getAsync<_i669.SupabaseClientWrapper>(),
      ),
    );
    gh.lazySingletonAsync<_i650.StoreRemoteDataSource>(
      () async => _i650.StoreRemoteDataSourceImpl(
        await getAsync<_i669.SupabaseClientWrapper>(),
      ),
    );
    gh.lazySingletonAsync<_i800.AuthRepository>(
      () async => _i461.AuthRepositoryImpl(
        await getAsync<_i519.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingletonAsync<_i376.MenuRemoteDataSource>(
      () async => _i376.MenuRemoteDataSourceImpl(
        await getAsync<_i669.SupabaseClientWrapper>(),
      ),
    );
    gh.lazySingletonAsync<_i64.CartRemoteDataSource>(
      () async => _i64.CartRemoteDataSourceImpl(
        await getAsync<_i669.SupabaseClientWrapper>(),
      ),
    );
    gh.lazySingletonAsync<_i33.OrderRemoteDataSource>(
      () async => _i33.OrderRemoteDataSourceImpl(
        await getAsync<_i669.SupabaseClientWrapper>(),
      ),
    );
    gh.lazySingletonAsync<_i463.CartRepository>(
      () async =>
          _i47.CartRepositoryImpl(await getAsync<_i64.CartRemoteDataSource>()),
    );
    gh.lazySingletonAsync<_i201.OrderRepository>(
      () async => _i642.OrderRepositoryImpl(
        await getAsync<_i33.OrderRemoteDataSource>(),
      ),
    );
    gh.lazySingletonAsync<_i997.MenuRepository>(
      () async => _i247.MenuRepositoryImpl(
        await getAsync<_i376.MenuRemoteDataSource>(),
      ),
    );
    gh.lazySingletonAsync<_i439.StoreRepository>(
      () async => _i4.StoreRepositoryImpl(
        await getAsync<_i650.StoreRemoteDataSource>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i109.InjectableModule {}
