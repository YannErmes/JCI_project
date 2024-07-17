import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:gestion_des_taches/Pages/Splach.dart';
import 'package:gestion_des_taches/Pages/espace_menbre/accueille_membre.dart';
import 'package:gestion_des_taches/Pages/home_pages.dart';
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:gestion_des_taches/apifire.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

/// commision formation
/// croissance et dev
/// managment
void main() async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic_notification',
          channelDescription: 'Notification_channel_for_basic_tests')
    ],
    debug: true,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(

          apiKey: "AIzaSyBxxvJCVCvq5ixIqz4U7RFPvrlGhrQJyR0",
          authDomain: "notification-9483c.firebaseapp.com",
          projectId: "notification-9483c",
          storageBucket: "notification-9483c.appspot.com",
          messagingSenderId: "669496845923",
          appId: "1:669496845923:web:8b29d199a2a983c98afa56"


      ));
  await Firebaseapi().initnitif();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: H(),
    );
  }
}
