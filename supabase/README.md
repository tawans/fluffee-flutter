# Fluffee Cafe - Supabase 설정 가이드

## 📋 개요
이 디렉토리는 Fluffee 카페 앱의 Supabase 백엔드 설정 파일들을 포함합니다.

## 🗄️ 데이터베이스 스키마

### 주요 테이블
1. **profiles** - 사용자 프로필 정보
2. **menu_categories** - 메뉴 카테고리 (커피, 티, 스무디, 디저트)
3. **menus** - 메뉴 아이템
4. **menu_options** - 메뉴 옵션 (사이즈, 온도 등)
5. **stores** - 매장 정보
6. **store_congestion** - 실시간 매장 혼잡도
7. **orders** - 주문 정보
8. **order_items** - 주문 아이템
9. **cart_items** - 장바구니 아이템
10. **user_favorite_stores** - 사용자 즐겨찾기 매장
11. **promotions** - 프로모션/이벤트

### 핵심 기능
- **자동 주문번호 생성**: FL + YYMMDD + 순번 (예: FL240101001)
- **실시간 주문 상태 업데이트**: received → preparing → ready → completed
- **Row Level Security**: 사용자별 데이터 접근 권한 관리
- **자동 프로필 생성**: 회원가입시 자동으로 프로필 테이블에 데이터 추가

## 📂 마이그레이션 파일

### 001_initial_schema.sql
- 기본 데이터베이스 테이블 생성
- 인덱스 및 트리거 설정
- 업데이트 시간 자동 관리

### 002_sample_data.sql
- 개발용 샘플 데이터
- 메뉴 카테고리 및 메뉴 아이템
- 샘플 매장 정보
- 프로모션 데이터

### 003_rls_policies.sql
- Row Level Security 정책 설정
- 사용자별 데이터 접근 권한
- 공개 데이터 (메뉴, 매장) 읽기 권한
- 주문 관련 보안 정책

### 004_storage_setup.sql
- Storage 버킷 생성
  - `menu-images`: 메뉴 이미지 (5MB 제한)
  - `profile-images`: 프로필 사진 (2MB 제한)
  - `promotion-images`: 프로모션 이미지 (10MB 제한)
- Storage 정책 설정

## 🚀 설정 방법

### 1. Supabase 프로젝트 생성
1. [Supabase](https://supabase.com) 에서 새 프로젝트 생성
2. 프로젝트 URL과 anon key 복사

### 2. 환경변수 설정
```dart
// lib/core/constants/app_constants.dart
static const String supabaseUrl = 'YOUR_SUPABASE_PROJECT_URL';
static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### 3. 마이그레이션 실행
Supabase 대시보드의 SQL Editor에서 순서대로 실행:
1. `001_initial_schema.sql`
2. `002_sample_data.sql`
3. `003_rls_policies.sql`
4. `004_storage_setup.sql`

### 4. Storage 버킷 확인
Supabase 대시보드의 Storage 섹션에서 다음 버킷들이 생성되었는지 확인:
- menu-images
- profile-images
- promotion-images

## 🔐 보안 정책

### 인증된 사용자
- 자신의 프로필 정보만 조회/수정 가능
- 자신의 주문 정보만 접근 가능
- 자신의 장바구니 아이템만 관리 가능
- 자신의 즐겨찾기 매장만 관리 가능

### 공개 접근
- 메뉴 카테고리 및 메뉴 아이템 조회
- 활성화된 매장 정보 조회
- 현재 진행중인 프로모션 조회
- 매장 혼잡도 정보 조회

## 📊 샘플 데이터

### 메뉴 카테고리
- 커피 (5개 아이템)
- 티 (4개 아이템)
- 스무디 (3개 아이템)
- 디저트 (4개 아이템)

### 매장
- Fluffee 강남점
- Fluffee 홍대점
- Fluffee 신촌점
- Fluffee 잠실점

### 프로모션
- 신메뉴 출시 기념 할인
- 겨울 시즌 스페셜
- 오픈 1주년 기념 이벤트

## 🔄 주문 플로우

1. **주문 접수** (received)
2. **제작 중** (preparing) - 5분 후 자동 변경
3. **픽업 가능** (ready) - 10분 후 자동 변경
4. **완료** (completed) - 수동 처리

## 🛠️ 개발 팁

### 테스트 데이터 리셋
```sql
-- 모든 주문 및 장바구니 데이터 삭제
DELETE FROM public.order_items;
DELETE FROM public.orders;
DELETE FROM public.cart_items;
DELETE FROM public.user_favorite_stores;
DELETE FROM public.profiles WHERE id != 'keep-your-test-user-id';
```

### 새로운 메뉴 추가
```sql
INSERT INTO public.menus (category_id, name, description, price, is_popular)
VALUES ('category-uuid', '새 메뉴', '설명', 5000, false);
```

### 매장 혼잡도 업데이트
```sql
UPDATE public.store_congestion 
SET congestion_level = 'high', updated_at = NOW()
WHERE store_id = 'store-uuid';
```