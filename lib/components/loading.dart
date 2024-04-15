import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: SpinKitFadingFour(
          color: Colors.indigo.shade200,
          size: 100.0,
        ),
      ),
    );
  }
}
