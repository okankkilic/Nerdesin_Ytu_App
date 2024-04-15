import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../components/loading.dart';

class BurdayimPage extends StatefulWidget {
  const BurdayimPage({super.key});

  @override
  State<BurdayimPage> createState() => _BurdayimPageState();
}

class _BurdayimPageState extends State<BurdayimPage> {
  /*
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  getRandomIcon() {
    Random random = Random();
    return randomIcon[random.nextInt(randomIcon.length)];
  }

   */

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');
  final updateRef = FirebaseDatabase.instance.ref().child('Users/lastUpdate');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Burdayım'),
        backgroundColor: Color(0xFF231F62),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          defaultChild: const Loading(),
          query: ref.orderByChild('lastUpdateList'),
          reverse: true,
          itemBuilder: (context, snapshot, animation, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 2),
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xFF37329F),
                              )),
                          child:
                              snapshot.child('profileImage').value.toString() ==
                                      ""
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
                        //isThreeLine: true,
                        title: RichText(
                          text: TextSpan(
                            text: snapshot.child('username').value.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5),
                          ),
                        ),
                        subtitle: Text(
                            '${snapshot.child('location').value.toString()} \n\nLast update: ${snapshot.child('lastUpdate').value.toString()}'),
                      ),
                    ),
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
