import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../components/loading.dart';

class HighScoreList extends StatefulWidget {
  const HighScoreList({super.key});

  @override
  State<HighScoreList> createState() => _HighScoreListState();
}

class _HighScoreListState extends State<HighScoreList> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Leaderboard - 2048'),
        backgroundColor: const Color(0xFF231F62),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          defaultChild: const Loading(),
          query: ref.orderByChild('highScore2048'),
          reverse: true,
          itemBuilder: (context, snapshot, animation, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 2),
              child: Column(
                children: [
                  ListTile(
                    title: Text(snapshot.child('username').value.toString()),
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.5,
                            color: const Color(0xFF37329F),
                          )),
                      child:
                          snapshot.child('profileImage').value.toString() == ""
                              ? const Icon(Icons.person_outline)
                              : FullScreenWidget(
                                  disposeLevel: DisposeLevel.Medium,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot
                                          .child('profileImage')
                                          .value
                                          .toString()),
                                    ),
                                  ),
                                ),
                    ),
                    trailing:
                        Text(snapshot.child('highScore2048').value.toString()),
                  ),
                  const Divider(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
