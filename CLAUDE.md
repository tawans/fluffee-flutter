# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application called "fake_cafe" - a franchise cafe mobile app for Fluffee brand. The project follows Clean Architecture principles and is designed to provide a production-ready cafe ordering and management experience. Currently in a basic state (default Flutter counter app) but architected for a comprehensive cafe management system using Supabase as the backend.

## Brand Identity - Fluffee

### 🦙 브랜드 아이덴티티
> Fluffee — cozy vibes in every cup.

Fluffee는 안데스의 구름처럼 포근한 알파카에서 영감을 받아, 세상에서 가장 부드럽고 따뜻한 한 잔을 선물합니다.
포근하고 따뜻한 분위기 속에서 편안한 시간을 보낼 수 있는 공간을 표현합니다.

### 🎨 컬러 팔레트
- **Primary**: Latte Beige `#DCC6B2`
- **Secondary**: Olive Green `#7D8F69`
- **Background**: Cream White `#FDF7F0`
- **Accent**: Coffee Brown `#6B4F4F`
- **Highlight**: Blush Pink `#F3D6D0`

### 🔤 폰트
- **Pretendard** (한글 & 영어 통일)
- 깔끔하고 현대적이며 가독성 높은 산세리프

### 🦙 로고 컨셉
- 알파카 얼굴을 심플한 선으로 표현
- 몽글몽글한 털을 구름 모양처럼 묘사
- 머리 위에 작게 커피잔을 얹어 포인트
- 둥글고 부드러운 서체의 워드마크와 함께 사용

### ✨ 톤 & 무드
- 포근하고 편안한 (Cozy & Calm)
- 따뜻하고 부드러운 (Warm & Fluffy)
- 감각적이고 트렌디한 (Trendy & Modern)

### Business Requirements

**Target Users**: Franchise cafe customers
**Brand**: Fluffee (플러피)

**Core Features**:
1. **Home**: Brand introduction, events/promotions, recommended/popular menu items
2. **Menu**: Category-based menu listings (coffee, tea, smoothies, desserts), detailed menu info with images, prices, descriptions, calories
3. **Store Locator**: Location-based nearby store search (list & map view), store details (address, phone, hours, congestion), favorite store management
4. **Ordering**: Menu selection and cart, pickup store selection, order status tracking (접수 → 제작 중 → 픽업 가능), automatic status updates after 5-10 minutes
5. **My Page**: Profile management, order history, favorite stores, optional coupon/points system

**Order Status Flow**: 주문 접수 → 제작 중 → 픽업 가능 (automatic progression with 5-10 minute intervals)

**Authentication**: Browse without login, login required for ordering and order history

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Supabase (PostgreSQL, Authentication, Storage, Real-time)
- **Architecture**: Clean Architecture with Domain, Data, and Presentation layers
- **State Management**: Riverpod (CodeGen)
- **Dependency Injection**: GetIt + Injectable
- **Data Classes**: Freezed
- **Routing**: GoRouter
- **Serialization**: JsonSerializable

## Development Commands

### Basic Commands
```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .

# Code generation (for Riverpod, Freezed, Injectable)
flutter pub run build_runner build --delete-conflicting-outputs
```

### Supabase Commands (Optional)
```bash
# Start local Supabase
supabase start

# Push database changes
supabase db push
```

### Platform-specific Build
```bash
# Android
flutter build apk
flutter build appbundle

# iOS
flutter build ios

# Web
flutter build web

# Desktop
flutter build macos
flutter build windows
flutter build linux
```

## Project Structure

The project follows Clean Architecture with the intended structure:

```
lib/
├── core/                # Common utilities, error handling
├── data/                # Supabase integration, repository implementations
│   ├── datasource/
│   ├── repository/
│   └── models/
├── domain/              # Entities, use cases, repository interfaces
├── presentation/        # UI, ViewModels, state management
│   ├── pages/
│   ├── widgets/
│   └── viewmodel/
├── di/                  # GetIt & Injectable configuration
└── main.dart            # Entry point
```

Currently only contains the default Flutter app structure.

## Development Guidelines

### Code Style & Architecture Rules
- **State Management**: Use Riverpod (CodeGen) exclusively with `@riverpod` annotations
- **Dependency Injection**: Use GetIt + Injectable for all DI
- **Data Models**: Create immutable data models with Freezed
- **Routing**: Use GoRouter for all navigation
- **Immutability**: Maintain state immutability using `const` and Freezed
- **Business Logic**: Execute all business logic through UseCases
- **Data Access**: Use Repository pattern for API/DB access

### Clean Architecture Layers
- **Presentation Layer**: UI, ViewModels, state management (`presentation/`)
- **Domain Layer**: Entities, UseCases, repository interfaces (`domain/`)
- **Data Layer**: Supabase integration, repository implementations (`data/`)
- **Dependency Flow**: presentation → domain ← data

### Code Generation
Run code generation after modifying annotated classes:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Folder Structure Guidelines
```
lib/
├── core/                # Common utilities, error handling
├── data/                # Supabase integration, repository implementations
│   ├── datasource/      # Remote/local data sources
│   ├── repository/      # Repository implementations
│   └── models/          # Data transfer objects
├── domain/              # Business logic layer
│   ├── entities/        # Core business objects
│   ├── repositories/    # Repository interfaces
│   └── usecases/        # Business use cases
├── presentation/        # UI layer
│   ├── pages/           # Screen widgets
│   ├── widgets/         # Reusable UI components
│   └── providers/       # Riverpod providers (ViewModels)
├── di/                  # Dependency injection setup
└── main.dart            # Application entry point
```

## Supabase Integration

### Backend Features
- **Authentication**: Email/password and social login support
- **Database**: PostgreSQL with Row Level Security (RLS)
- **Storage**: File and image uploads for menu photos
- **Real-time**: Live data subscriptions for order status updates
- **API**: Auto-generated REST & GraphQL APIs

### Implementation Guidelines
- Use official Supabase Flutter SDK
- Implement Row Level Security for data access control
- Configure real-time subscriptions for order status changes
- Store menu images and profile photos in Supabase Storage

## Domain Entities & Use Cases

### Core Entities
- **User**: Profile, authentication info, favorite stores
- **Menu**: Categories, items, prices, descriptions, images, calories
- **Store**: Location, contact info, hours, congestion status
- **Order**: Items, status, pickup store, timing
- **Cart**: Selected items, quantities, total price

### Key Use Cases
- **Authentication**: Login, logout, profile management
- **Menu Management**: Browse categories, view details, search
- **Store Management**: Find nearby stores, view details, manage favorites
- **Order Management**: Add to cart, place order, track status, view history
- **Location Services**: Get current location, calculate distances

## Key Dependencies

### Current
- `cupertino_icons: ^1.0.8`
- `flutter_lints: ^5.0.0` (dev)

### To be Added
- `riverpod_annotation` + `riverpod_generator` (state management)
- `freezed` + `freezed_annotation` + `json_annotation` (data models)
- `get_it` + `injectable` (dependency injection)
- `go_router` (navigation)
- `supabase_flutter` (backend integration)
- `build_runner` (code generation)
- `geolocator` (location services)
- `google_maps_flutter` (store locator)

## Testing Strategy

- Widget tests for UI components
- Unit tests for UseCases and business logic
- Integration tests for critical user flows
- Mock Supabase services for testing


Please answer in Korean(한국어) only.