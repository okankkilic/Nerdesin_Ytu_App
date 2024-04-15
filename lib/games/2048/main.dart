import 'package:flutter/material.dart';

import 'home.dart';

void puzzleMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyPuzzleApp());
}

class MyPuzzleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2048',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'StarJedi'),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
