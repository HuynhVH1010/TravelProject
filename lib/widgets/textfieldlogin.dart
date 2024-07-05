import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildTextFieldLogin({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  required Icon prefixIcon,
  bool obscureText = false,
}) {
  return TextField(
    textInputAction: TextInputAction.done,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      floatingLabelStyle: TextStyle(color: Colors.blue),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      focusColor: Colors.blue,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          width: 2,
          color: Colors.blue,
        ),
      ),
      prefixIcon: prefixIcon,
    ),
    obscureText: obscureText,
    controller: controller,
  );
}
