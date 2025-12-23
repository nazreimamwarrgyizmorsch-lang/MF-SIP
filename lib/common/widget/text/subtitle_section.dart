import 'package:flutter/material.dart';
import 'package:my_sip/utils/constant/text_style.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.subtitle, this.textAlignCenter});

  final String subtitle;

  final TextAlign? textAlignCenter;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: UTextStyles.subtitle1.copyWith(color: Colors.grey[600]),
      textAlign: textAlignCenter ?? TextAlign.center,
    );
  }
}


