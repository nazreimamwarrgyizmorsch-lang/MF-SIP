import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sip/utils/constant/text_style.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: UTextStyles.heading2.copyWith(fontSize: Get.width * 0.06),
    );
  }
}
