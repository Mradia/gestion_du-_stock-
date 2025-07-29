  import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String labelText, IconData icon,double sizew) {
    return InputDecoration(
      labelText: labelText,
      icon: Icon(icon),
      labelStyle: TextStyle(
        color: Colors.white,
        fontSize:sizew
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }