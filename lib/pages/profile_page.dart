import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nerdesin_ytu/components/profile_cards.dart';
import 'package:nerdesin_ytu/pages/add_lesson_page.dart';
import 'package:nerdesin_ytu/pages/game_page.dart';
import 'package:nerdesin_ytu/pages/nerdesin_butonu.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

import '../components/get_username_card.dart';
import '../components/nerdesin_yazsana_card.dart';
import '../new_components/profile_image.dart';
import '../services/auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final locControler = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;
  final AuthServices _auth = AuthServices();
  final ref = FirebaseDatabase.instance.ref('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Profilim'),
        backgroundColor: const Color(0xFF231F62),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ProfileImage(),
                  const SizedBox(
                    height: 10,
                  ),
                  GetProfileCard(),
                  ProfileCard(
                    title: 'Nerdesin Butonu',
                    icon: Icons.warning_amber,
                    widget: const NerdesinButton(),
                  ),
                  NerdesinYazsanaCard(
                      icon: Ionicons.heart_outline, title: 'Nerdesin Yazsana'),
                  ProfileCard(
                    title: 'Ders Ekle/Sil',
                    icon: Icons.my_library_books_outlined,
                    widget: const AddLessonPage(),
                  ),
                  ProfileCard(
                    title: 'Oyunlar',
                    icon: Icons.games_outlined,
                    widget: const GamePage(),
                  ),
                  /*ProfileCard(
                    title: 'Otobüs/Ring/Yemek',
                    icon: Ionicons.time_outline,
                    widget: const UrlPage(),
                  ),

                   */
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    shadowColor: Colors.black,
                    color: Colors.red,
                    //color: Colors.red[500],
                    margin: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        child: ListTile(
                          onLongPress: () async {
                            await _auth.signOut().then((value) {
                              SessionController().userId = '';
                            });
                          },
                          leading: const Icon(
                            Icons.door_back_door_outlined,
                            size: 40,
                            color: Colors.black38,
                          ),
                          //isThreeLine: true,
                          title: RichText(
                            text: const TextSpan(
                              text: 'Çıkış Yap',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 20, 16, 55),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Made By Okan",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
