import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nerdesin_ytu/components/loading.dart';
import 'package:nerdesin_ytu/services/session_manager.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  XFile? imageFile;

  String? profileUrl;

  //String profileUrl = 'https://cdn-icons-png.flaticon.com/512/14/14415.png';
  Future takePhoto(BuildContext context, ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
    );

    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
      uploadImage(context);
    }
  }

  void uploadImage(BuildContext context) async {
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + SessionController().userId.toString());

    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(imageFile!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();
    /* setState(() {
      profileUrl = newUrl;
    });

    */

    ref
        .child(SessionController().userId.toString())
        .update({'profileImage': newUrl.toString()}).then((value) {
      const Text('Profile Update');
      imageFile = null;
    }).onError((error, stackTrace) {
      const Text('HATA');
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.child(SessionController().userId.toString()).onValue,
      builder: (context, AsyncSnapshot snapshot) {
        //!snapshot.hasData
        if (!snapshot.hasData) {
          return CircleAvatar(
            radius: 75.0,
            backgroundColor: Colors.grey[400],
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.5,
                    color: Color(0xFF231F62),
                  )),
            ),
          );
        } else if (snapshot.hasData) {
          //Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
          return Center(
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Colors.grey[200],
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.5,
                          color: const Color(0xFF37329F),
                        )),
                    child: FullScreenWidget(
                      disposeLevel: DisposeLevel.Medium,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileUrl != null
                              ? profileUrl!
                              : 'https://cdn-icons-png.flaticon.com/512/14/14415.png',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const Loading(),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 7.0,
                  right: 7.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(1),
                    //color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color(0xFF37329F),
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Text('HATA');
        }
      },
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(this.context, ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(this.context, ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
