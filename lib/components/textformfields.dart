import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final validator;
  final onSaved;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.grey[600]!.withOpacity(0.5),
          color: Colors.grey[600]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              //border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              //fillColor: Colors.red,
              //fillColor: Colors.grey.shade200,
              // filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[300])),
        ),
      ),
    );
  }
}
