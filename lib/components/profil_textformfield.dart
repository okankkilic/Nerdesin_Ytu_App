import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilTextFormField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const ProfilTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          maxLength: 25,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              //border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              //fillColor: Colors.red,
              //fillColor: Colors.grey.shade200,
              // filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400])),
        ),
      ),
    );
  }
}
