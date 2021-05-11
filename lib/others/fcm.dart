import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_service.dart';

var notification = NotificationServicer();

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
    log("Data:$data");
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
    log("Notification:$notification");
  }
}

handleFcm() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _firebaseMessaging.getToken().then((value) => log("DeviceToken:$value"));
  _firebaseMessaging.configure(
    onBackgroundMessage: myBackgroundMessageHandler,
    onMessage: (Map<String, dynamic> message) async {
      log("onMessage:$message");
      notification.showNotification(
          message['notification']['title'], message['notification']['body']);
    },
    onLaunch: (Map<String, dynamic> message) async {
      log("onLaunch:$message");
    },
    onResume: (Map<String, dynamic> message) async {
      log("onResume:$message");
    },
  );
}
