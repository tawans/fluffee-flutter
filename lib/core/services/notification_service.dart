import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../domain/entities/order.dart';

/// 알림 타입
enum NotificationType {
  orderStatus, // 주문 상태 변경
  promotion, // 프로모션
  general, // 일반 알림
}

/// 알림 데이터
class NotificationData {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final Map<String, dynamic>? data;
  final DateTime timestamp;

  const NotificationData({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    required this.timestamp,
  });

  factory NotificationData.fromRemoteMessage(RemoteMessage message) {
    return NotificationData(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      type: _parseNotificationType(message.data['type']),
      data: message.data,
      timestamp: DateTime.now(),
    );
  }

  static NotificationType _parseNotificationType(String? type) {
    switch (type) {
      case 'order_status':
        return NotificationType.orderStatus;
      case 'promotion':
        return NotificationType.promotion;
      default:
        return NotificationType.general;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type.name,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// 푸시 알림 서비스
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  // 알림 스트림
  final StreamController<NotificationData> _notificationController = StreamController<NotificationData>.broadcast();
  Stream<NotificationData> get notificationStream => _notificationController.stream;

  // 알림 설정 상태
  bool _isInitialized = false;
  String? _fcmToken;

  /// 초기화
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Firebase 초기화
      await Firebase.initializeApp();

      // 로컬 알림 초기화
      await _initializeLocalNotifications();

      // Firebase 메시징 설정
      await _initializeFirebaseMessaging();

      _isInitialized = true;
      // print('NotificationService initialized successfully');
    } catch (e) {
      // print('Failed to initialize NotificationService: $e');
    }
  }

  /// 로컬 알림 초기화
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Android 알림 채널 생성
    if (Platform.isAndroid) {
      await _createNotificationChannels();
    }
  }

  /// Firebase 메시징 초기화
  Future<void> _initializeFirebaseMessaging() async {
    // 권한 요청
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('User granted notification permission');

      // FCM 토큰 가져오기
      _fcmToken = await _firebaseMessaging.getToken();
      // print('FCM Token: $_fcmToken');

      // 토큰 갱신 리스너
      _firebaseMessaging.onTokenRefresh.listen((token) {
        _fcmToken = token;
        // print('FCM Token refreshed: $token');
        // 서버에 새 토큰을 전송하는 로직을 여기에 추가
      });

      // 포그라운드 메시지 리스너
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // 백그라운드에서 앱 열기 리스너
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // 앱이 종료된 상태에서 알림으로 열기
      final initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        _handleMessageOpenedApp(initialMessage);
      }
    } else {
      // print('User declined notification permission');
    }
  }

  /// Android 알림 채널 생성
  Future<void> _createNotificationChannels() async {
    // 주문 상태 알림 채널
    const orderChannel = AndroidNotificationChannel(
      'order_status',
      'Order Status',
      description: 'Notifications for order status updates',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    );

    // 프로모션 알림 채널
    const promotionChannel = AndroidNotificationChannel(
      'promotion',
      'Promotions',
      description: 'Promotional notifications',
      importance: Importance.defaultImportance,
    );

    // 일반 알림 채널
    const generalChannel = AndroidNotificationChannel(
      'general',
      'General',
      description: 'General notifications',
      importance: Importance.defaultImportance,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(orderChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(promotionChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(generalChannel);
  }

  /// 포그라운드 메시지 처리
  void _handleForegroundMessage(RemoteMessage message) {
    final notificationData = NotificationData.fromRemoteMessage(message);
    
    // 로컬 알림 표시
    _showLocalNotification(notificationData);
    
    // 스트림에 알림 데이터 전송
    _notificationController.add(notificationData);
  }

  /// 백그라운드에서 앱 열기 처리
  void _handleMessageOpenedApp(RemoteMessage message) {
    final notificationData = NotificationData.fromRemoteMessage(message);
    
    // 스트림에 알림 데이터 전송
    _notificationController.add(notificationData);
    
    // 알림 타입에 따른 네비게이션 처리
    _handleNotificationNavigation(notificationData);
  }

  /// 알림 탭 처리
  void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null) {
      try {
        final data = jsonDecode(response.payload!);
        final notificationData = NotificationData(
          id: data['id'],
          title: data['title'],
          body: data['body'],
          type: NotificationData._parseNotificationType(data['type']),
          data: data['data'],
          timestamp: DateTime.parse(data['timestamp']),
        );

        _notificationController.add(notificationData);
        _handleNotificationNavigation(notificationData);
      } catch (e) {
        // print('Error parsing notification payload: $e');
      }
    }
  }

  /// 알림 네비게이션 처리
  void _handleNotificationNavigation(NotificationData notification) {
    switch (notification.type) {
      case NotificationType.orderStatus:
        final orderId = notification.data?['order_id'];
        if (orderId != null) {
          // 주문 추적 페이지로 이동
          // Navigator.pushNamed(context, '/order/tracking/$orderId');
          // print('Navigate to order tracking: $orderId');
        }
        break;
      case NotificationType.promotion:
        // 프로모션 페이지로 이동
        // print('Navigate to promotions');
        break;
      case NotificationType.general:
        // 홈 페이지로 이동
        // print('Navigate to home');
        break;
    }
  }

  /// 로컬 알림 표시
  Future<void> _showLocalNotification(NotificationData notification) async {
    final channelId = _getChannelId(notification.type);
    
    final androidDetails = AndroidNotificationDetails(
      channelId,
      _getChannelName(notification.type),
      channelDescription: _getChannelDescription(notification.type),
      importance: notification.type == NotificationType.orderStatus 
          ? Importance.high 
          : Importance.defaultImportance,
      priority: notification.type == NotificationType.orderStatus 
          ? Priority.high 
          : Priority.defaultPriority,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      notification.id.hashCode,
      notification.title,
      notification.body,
      details,
      payload: jsonEncode(notification.toJson()),
    );
  }

  /// 주문 상태 알림 생성
  Future<void> showOrderStatusNotification({
    required String orderId,
    required OrderStatus status,
    required String storeName,
  }) async {
    final title = _getOrderStatusTitle(status);
    final body = _getOrderStatusBody(status, storeName);

    final notification = NotificationData(
      id: 'order_$orderId',
      title: title,
      body: body,
      type: NotificationType.orderStatus,
      data: {
        'order_id': orderId,
        'status': status.name,
        'store_name': storeName,
      },
      timestamp: DateTime.now(),
    );

    await _showLocalNotification(notification);
    _notificationController.add(notification);
  }

  /// 프로모션 알림 생성
  Future<void> showPromotionNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final notification = NotificationData(
      id: 'promo_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      body: body,
      type: NotificationType.promotion,
      data: data,
      timestamp: DateTime.now(),
    );

    await _showLocalNotification(notification);
    _notificationController.add(notification);
  }

  /// 일반 알림 생성
  Future<void> showGeneralNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final notification = NotificationData(
      id: 'general_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      body: body,
      type: NotificationType.general,
      data: data,
      timestamp: DateTime.now(),
    );

    await _showLocalNotification(notification);
    _notificationController.add(notification);
  }

  /// FCM 토큰 가져오기
  String? get fcmToken => _fcmToken;

  /// 알림 권한 상태 확인
  Future<bool> hasPermission() async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  /// 알림 권한 요청
  Future<bool> requestPermission() async {
    final settings = await _firebaseMessaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  /// 서비스 해제
  void dispose() {
    _notificationController.close();
  }

  // Helper methods
  String _getChannelId(NotificationType type) {
    switch (type) {
      case NotificationType.orderStatus:
        return 'order_status';
      case NotificationType.promotion:
        return 'promotion';
      case NotificationType.general:
        return 'general';
    }
  }

  String _getChannelName(NotificationType type) {
    switch (type) {
      case NotificationType.orderStatus:
        return 'Order Status';
      case NotificationType.promotion:
        return 'Promotions';
      case NotificationType.general:
        return 'General';
    }
  }

  String _getChannelDescription(NotificationType type) {
    switch (type) {
      case NotificationType.orderStatus:
        return 'Notifications for order status updates';
      case NotificationType.promotion:
        return 'Promotional notifications';
      case NotificationType.general:
        return 'General notifications';
    }
  }

  String _getOrderStatusTitle(OrderStatus status) {
    switch (status) {
      case OrderStatus.received:
        return '주문이 접수되었습니다';
      case OrderStatus.preparing:
        return '음료를 제작 중입니다';
      case OrderStatus.ready:
        return '주문이 완료되었습니다';
      case OrderStatus.completed:
        return '픽업이 완료되었습니다';
      case OrderStatus.cancelled:
        return '주문이 취소되었습니다';
    }
  }

  String _getOrderStatusBody(OrderStatus status, String storeName) {
    switch (status) {
      case OrderStatus.received:
        return '$storeName에서 주문을 확인했습니다. 잠시만 기다려주세요.';
      case OrderStatus.preparing:
        return '$storeName에서 음료를 제작하고 있습니다. 조금만 더 기다려주세요.';
      case OrderStatus.ready:
        return '$storeName에서 음료가 준비되었습니다. 매장에서 픽업해주세요.';
      case OrderStatus.completed:
        return '$storeName에서 픽업이 완료되었습니다. 감사합니다!';
      case OrderStatus.cancelled:
        return '$storeName에서 주문이 취소되었습니다.';
    }
  }
}

/// 백그라운드 메시지 핸들러
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // print('Handling a background message: ${message.messageId}');
}