import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../api/firebase_api.dart';
import '../components/loading.dart';
import '../services/session_manager.dart';

class NerdesinButton extends StatefulWidget {
  const NerdesinButton({super.key});

  @override
  State<NerdesinButton> createState() => _NerdesinButtonState();
}

class _NerdesinButtonState extends State<NerdesinButton> {
/*
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher'),
            ));
      }
    });
  }
 */
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref('Users');
    return StreamBuilder(
      stream: ref.child(SessionController().userId.toString()).onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Loading();
        } else {
          Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: const Text('Nerdesiniz?!?1?!?'),
              backgroundColor: const Color(0xFF231F62),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        pushNotificationsAllUsers(
                          username: map['username'],
                        );
                        Navigator.of(context).pop();
                      },
                      child: Card(
                        color: Colors.red[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000)),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            '!',
                            style: TextStyle(
                                fontSize: 200, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
