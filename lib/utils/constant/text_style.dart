import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class UTextStyles {
  static TextStyle heading1 = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w700,
    // fontStyle: FontStyle.normal,
    fontSize: (Get.width * 0.07).clamp(26, 30),
    height: 45 / 30, // ≈ 1.5
    letterSpacing: 0,
    color: Ucolors.dark,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    // fontSize: (Get.width * 0.07).clamp(24, 30),
    fontSize: 24,
    height: 36 / 24,
    letterSpacing: 0,
    color: Ucolors.dark,
  );

  static TextStyle subtitle1 = TextStyle(
    fontFamily: 'Geist',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,

    fontSize: (Get.width * 0.042).clamp(12, 16),
    // fontSize: 16,
    height: 1.5,
    letterSpacing: 0,
    color: Color(0xff787878),
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Ucolors.darkgrey,
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Ucolors.light,
  );

  static TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Ucolors.darkgrey,
  );
}
