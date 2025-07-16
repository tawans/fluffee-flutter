import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/config/env_config.dart';

@lazySingleton
class SupabaseClientWrapper {
  late final SupabaseClient _client;

  SupabaseClient get client => _client;

  SupabaseClientWrapper() {
    _client = Supabase.instance.client;
  }

  @factoryMethod
  static Future<SupabaseClientWrapper> create() async {
    await Supabase.initialize(
      url: EnvConfig.supabaseUrl,
      anonKey: EnvConfig.supabaseAnonKey,
    );
    return SupabaseClientWrapper();
  }
}