import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';

class GetLocationData extends StatefulWidget {
  String locationData;
  GetLocationData({super.key, required this.locationData});

  @override
  State<GetLocationData> createState() => _GetLocationDataState();
}

class _GetLocationDataState extends State<GetLocationData> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: (context, snapshot, animation, index) {
        return Text(snapshot
            .child('Location')
            .child(widget.locationData)
            .value
            .toString());
      },
    );
  }
}
