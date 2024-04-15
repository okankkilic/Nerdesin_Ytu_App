/*
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
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

  Future takePhoto(BuildContext context, ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: source,
    );

    if (pickedFile != null) {
      imageFile = XFile(pickedFile.path);
      uploadImage(context);
    }
/*
    setState(() {
      imageFile = pickedFile;
    });

 */
  }

  void uploadImage(BuildContext context) async {
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + SessionController().userId.toString());

    firebase_storage.UploadTask uploadTask =
    storageRef.putFile(File(imageFile!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    ref
        .child(SessionController().userId.toString())
        .update({'profileImage': newUrl.toString()}).then((value) {
      Text('Profile Update');
      imageFile = null;
    }).onError((error, stackTrace) {
      Text('HATA');
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.child(SessionController().userId.toString()).onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        } else if (snapshot.hasData) {
          Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
          return Center(
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Color(0x6E278FC7),
                  child: CircleAvatar(
                    radius: 70.0,
                    /*
                   backgroundImage: imageFile == null
                        ? AssetImage('lib/images/avatar.jpg')
                        : Image.file(File(imageFile!.path), fit: BoxFit.cover)
                            .image
                            ),
                    */
                    backgroundImage: map['profileImage'].toString() == ""
                        ? const Icon(
                      Icons.person,
                      size: 35,
                    )
                        : Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(map['profileImage'].toString()),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: Loading());
                      },
                      errorBuilder: (context, object, stack) {
                        return Container(
                          child: Icon(Icons.error_outline,
                              color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 20.0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.teal,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
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
                takePhoto(context, ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(context, ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}

 */
