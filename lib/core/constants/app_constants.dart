class AppConstants {
  AppConstants._();

  // App
  static const String appName = 'Fluffee';
  static const String appTagline = 'cozy vibes in every cup';
  
  // Supabase
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
  
  // API
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Order Status
  static const String orderStatusReceived = '주문 접수';
  static const String orderStatusPreparing = '제작 중';
  static const String orderStatusReady = '픽업 가능';
  
  // Order Status Update Intervals
  static const Duration orderPreparingInterval = Duration(minutes: 5);
  static const Duration orderReadyInterval = Duration(minutes: 10);
}