import 'package:flutter/material.dart';

Container contain(double widthScreen, double heightScreen, String text) {
  return Container(
    width: widthScreen * 0.07,
    height: heightScreen * 0.025,
    color: Colors.white,
    child: Text(
      text,
      style: TextStyle(
        fontSize: widthScreen * 0.009,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
