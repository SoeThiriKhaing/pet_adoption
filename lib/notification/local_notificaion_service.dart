import "package:flutter/foundation.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:injectable/injectable.dart";
import "notification_image_cache.dart";

@singleton
class LocalNotificationService {
  LocalNotificationService._internal();

  static final _instance = LocalNotificationService._internal();

  factory LocalNotificationService() => _instance;

  static DidReceiveNotificationResponseCallback? _onNotificationTapped;

  set onNotificationTapped(DidReceiveNotificationResponseCallback? value) =>
      _onNotificationTapped = value;

  static bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    await _startPlugin();
    _initialized = true;
  }
  static late FlutterLocalNotificationsPlugin _localNotiPlugin;

  FlutterLocalNotificationsPlugin get localNotiPlugin => _localNotiPlugin;

  static Future<void> _startPlugin() async {
    _localNotiPlugin = FlutterLocalNotificationsPlugin();

    const androidConfig = AndroidInitializationSettings("mipmap/ic_launcher");
    const iosConfig = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidConfig,
      iOS: iosConfig,
    );

    await _localNotiPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse: onNotificationTapBackgound,
    );
  }

  Future<void> showBigTextNotification({
    String? id,
    required String title,
    required String body,
    String? payload,
    String? imageUrl,
  }) async {
    final filePath = await NotificationImageCache.getCachedFile(imageUrl);
    if (kDebugMode) {
      print('Image URL: $imageUrl');
      print('File Path: $filePath');
    }

    final bigPictureStyleInformation = filePath == null
        ? null
        : BigPictureStyleInformation(
            FilePathAndroidBitmap(filePath),
            largeIcon: FilePathAndroidBitmap(filePath),
          );
    final androidNotificationDetails = AndroidNotificationDetails(
      "com.umg.cid.hi5",
      "Hi5 Custom Notification",
      channelDescription: "Notifications for Hi5 app.",
      playSound: true,
      importance: Importance.defaultImportance,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
    );

    final darwinNotificationDetails = DarwinNotificationDetails(
      attachments: [
        if (filePath != null) DarwinNotificationAttachment(filePath),
      ],
    );

    final notidetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await _localNotiPlugin.show(
      id: id?.hashCode ?? 0,
      title: title,
      body: body,
      notificationDetails: notidetails,
      payload: payload,
    );
  }

  @pragma('vm:entry-point')
  static void onNotificationTapBackgound(NotificationResponse response) {
    if (kDebugMode) {
      print(
        'notification(${response.id}) action tapped: '
        '${response.actionId} with'
        ' payload: ${response.payload}',
      );
    }
  }
}
