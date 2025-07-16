class AppConstants {
  AppConstants._();

  // App
  static const String appName = 'Fluffee';
  static const String appTagline = 'cozy vibes in every cup';
  
  // Supabase - 실제 배포시에는 환경변수나 별도 설정 파일에서 읽어와야 합니다
  static const String supabaseUrl = 'https://placeholder.supabase.co';
  static const String supabaseAnonKey = 'placeholder-anon-key';
  
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