import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nerdesin_ytu/pages/wrapper.dart';
import 'package:nerdesin_ytu/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'api/firebase_api.dart';
import 'firebase_options.dart';
import 'games/new2048/models/board_adapter.dart';
import 'models/user.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    //'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(BoardAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
        value: AuthServices().user,
        updateShouldNotify: (_, __) => true,
        catchError: (_, __) {
          return null;
        },
        initialData: null,
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(), //wrapper(),
        ));
  }
}
