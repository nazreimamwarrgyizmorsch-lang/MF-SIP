import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sip/common/widget/button/elevated_button.dart';
import 'package:my_sip/utils/constant/colors.dart';
import 'package:my_sip/utils/constant/text_style.dart';

class PrimaryBackBottomBar extends StatelessWidget {
  final String primaryText;

  final VoidCallback onPrimaryPressed;

  final VoidCallback? onBackPressed;

  final String backText;

  const PrimaryBackBottomBar({
    super.key,
    required this.primaryText,
    required this.onPrimaryPressed,
    this.onBackPressed,
    this.backText = 'Back',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // bottom: MediaQuery.of(context).padding.bottom + 16,
        bottom: Get.height * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Primary Elevated Button
          SizedBox(
            child: UElevatedBUtton(
              onPressed: onPrimaryPressed,
              child: Text(primaryText, style: UTextStyles.buttonText),
            ),
          ),
          SizedBox(height: Get.height * 0.013),

          //back button if provided
          if (onBackPressed != null) ...[
            TextButton(
              onPressed: onBackPressed,
              child: Text(
                backText,
                style: UTextStyles.buttonText.copyWith(color: Ucolors.dark),
              ),
            ),
            // SizedBox(height: Get.height * 0.01),
          ],
        ],
      ),
    );
  }
}
