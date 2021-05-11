import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServicer {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  NotificationServicer() {
    initLocalNotification();
  }
  FlutterLocalNotificationsPlugin initLocalNotification() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initSetttings = new InitializationSettings(android, null);
    flutterLocalNotificationsPlugin.initialize(
      initSetttings,
    );

    return flutterLocalNotificationsPlugin;
  }

  showNotification(String title, String body) async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.Max, importance: Importance.Max);
    var platform = new NotificationDetails(android, null);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platform,
    );
  }
}
