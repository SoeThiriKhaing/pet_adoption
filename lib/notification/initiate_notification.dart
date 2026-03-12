import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import '../di/injector.dart';
import 'firebase_notification_service.dart';
import 'local_notificaion_service.dart';

Future<void> initializeNotifications() async {
  final localNotification = inject<LocalNotificationService>();
  final firebaseNotification = inject<FirebaseNotificationService>();

  try {
    firebaseNotification.onFCMTokenChanged = (fcmToken) async {
      debugPrint('User granted permission');
      // ignore: avoid_print
      print("FCM token is ${fcmToken!}");

      final deviceInfo = DeviceInfoPlugin();

      String? deviceId;
      if (Platform.isIOS) {
        final iosDeviceInfo = await deviceInfo.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor;
      } else if (Platform.isAndroid) {
        final androidDeviceInfo = await deviceInfo.androidInfo;
        deviceId = androidDeviceInfo.id;
      }

      // inject<LocalStorageRepository>().fcmToken = fcmToken;
      // await appStorage.saveDeviceId(deviceId ?? '');
      // await appStorage.saveFcmToken(fcmToken);
    };

    firebaseNotification.onMessageOpenedApp = (res) async {
      debugPrint("Remote message: $res");
      _handleUserClick();
    };

    firebaseNotification.onInitialNotification = (res) async {
      debugPrint("Remote message: $res");
      _handleUserClick();
    };

    localNotification.onNotificationTapped = (res) async {
      debugPrint("Local Noti Tapped : $res");
      final data = res.payload == null ? null : jsonDecode(res.payload!);
      _handleUserClick();
    };
    await Future.wait([
      localNotification.initialize(),
      firebaseNotification.initialize(),
    ]);
  } catch (e) {
    debugPrint('Error during notification initialization: $e');
  }
}

Future<void> _handleUserClick() async {}
