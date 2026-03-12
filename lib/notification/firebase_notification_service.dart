import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'local_notificaion_service.dart';

@singleton
@pragma('vm:entry-point')
class FirebaseNotificationService {
  final LocalNotificationService _localNotificationService;

  FirebaseNotificationService(this._localNotificationService);
  static Future<void> Function(RemoteMessage?)? _onMessageReceived;
  static Future<void> Function(String?)? _onFCMTokenChanged;
  static Future<void> Function(RemoteMessage)? _onInitialNotification;
  static Future<void> Function(RemoteMessage)? _onMessageOpenedApp;

  set onMessageReceived(Future<void> Function(RemoteMessage?) value) =>
      _onMessageReceived = value;

  set onFCMTokenChanged(Future<void> Function(String?) value) =>
      _onFCMTokenChanged = value;

  set onInitialNotification(Future<void> Function(RemoteMessage)? value) =>
      _onInitialNotification = value;

  set onMessageOpenedApp(Future<void> Function(RemoteMessage)? value) =>
      _onMessageOpenedApp = value;

  static bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    try {
      _firebaseMessaging = FirebaseMessaging.instance;
      await _requestPermission();
      await _startService();
      _initialized = true;
    } on Exception {
      _initialized = false;
    }
  }

  static late FirebaseMessaging _firebaseMessaging;

  // ignore: unused_field
  static late NotificationSettings _settings;

  static Future<void> _requestPermission() async {
    _settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static String? _fcmToken;

  String? get fcmToken => _fcmToken;

  Future<void> loadFCMToken() async {
    final value = await _firebaseMessaging.getToken();
    _fcmToken = value;
    await _onFCMTokenChanged?.call(value);
  }

  static String? _initialRedirectPath;

  String? get initialRedirectPath => _initialRedirectPath;

  void closeInitialPath() {
    _initialRedirectPath = null;
  }

  Future<void> _startService() async {
    await _userClickMessageFromTerminate();
    final initialNotification = await _firebaseMessaging.getInitialMessage();
    if (initialNotification != null) {
      await _onInitialNotification?.call(initialNotification);
    }

    _fcmToken = await _firebaseMessaging.getToken();
    await _onFCMTokenChanged?.call(_fcmToken);
    await _firebaseMessaging.subscribeToTopic("broadcast");
    await _broadcastIncomingNotifications();
    await _broadcastIncomingBackgroundNotifications();
  }

  Future<String?> getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> _userClickMessageFromTerminate() async {
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp?.call);
  }

  Future<void> _broadcastIncomingNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) print("Incoming Local Notification");
      if (Platform.isAndroid) {
        await showLocalNotificationWithRetry(
          id: message.data['notiId'] ?? '0',
          title: message.notification?.title ?? "",
          body: message.notification?.body ?? "",
          payload: jsonEncode(message.data),
          imageUrl:
              message.notification?.android?.imageUrl ??
              message.notification?.apple?.imageUrl,
        );
      }
      _onMessageReceived?.call(message);
    });
  }

  @pragma('vm:entry-point')
  static Future<void> _onBackgroundNotification(RemoteMessage message) async {
    if (kDebugMode) print("Background Notification Received $message");
    if (kDebugMode) {
      print("Noti save at background.Title =>${message.notification?.title}");
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _broadcastIncomingBackgroundNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_onBackgroundNotification);
  }

  Future<void> showLocalNotificationWithRetry({
    required String id,
    required String title,
    required String body,
    String? imageUrl,
    required String payload,
    int maxRetries = 5,
    Duration delay = const Duration(seconds: 2),
  }) async {
    int attempt = 0;
    while (attempt < maxRetries) {
      try {
        debugPrint('Showing Local Noti');
        await _localNotificationService.showBigTextNotification(
          id: id,
          title: title,
          body: body,
          imageUrl: imageUrl,
          payload: payload,
        );
        break;
      } catch (e) {
        if (e.toString().contains(
          'ClientException with SocketException: No route to host',
        )) {
          maxRetries = maxRetries++;
        }
        attempt++;
        debugPrint("Attempt $attempt failed: ${e.toString()}");
        if (attempt >= maxRetries) {
          debugPrint("Error occurred: ${e.toString()}");
        } else {
          // Wait for the specified delay before retrying
          await Future.delayed(delay);
        }
      }
    }
  }
}
