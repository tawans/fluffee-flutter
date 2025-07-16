class EnvConfig {
  EnvConfig._();

  // Supabase 실제 키는 여기에 직접 입력하거나 환경변수에서 읽어오세요
  static const String supabaseUrl = 'https://your-project.supabase.co';
  static const String supabaseAnonKey = 'your-anon-key-here';
  
  // 테스트용 더미 데이터 모드
  static const bool useDummyData = true;
}