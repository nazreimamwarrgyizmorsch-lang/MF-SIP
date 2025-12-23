import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sip/common/style/padding.dart';
import 'package:my_sip/common/widget/button/elevated_button.dart';
import 'package:my_sip/features/authentication/screen/onboarding/onboarding_page.dart';
import 'package:my_sip/features/authentication/screen/onboarding/widget/imp_container.dart';
import 'package:my_sip/utils/constant/colors.dart';
import 'package:my_sip/utils/constant/text_style.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              //Top portion
              ImpContainer(),

              //welcome page content
              TitleContent1(),

              //Let’s Get Started Button
              BottomPortion(),

              SizedBox(height: kBottomNavigationBarHeight),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomPortion extends StatelessWidget {
  const BottomPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return UElevatedBUtton(
      onPressed: () => Get.to(() => OnboardingPage()),
      // onPressed: () => Get.to(() => OnboardingScreen()),
      child: Row(
        children: [
          Text('Let’s Get Started', style: TextStyle(color: Ucolors.light)),
          // Icon(Icons.arrow_forward_outlined, color: Ucl,),
        ],
      ),
    );
  }
}

class TitleContent1 extends StatelessWidget {
  TitleContent1({super.key});

  final List<String> text = [
    'Smart Goal Tracking',
    'Auto SIP Calculator',
    'Flexible Investment Control',
    'Real-Time Portfolio Insights',
    'Risk-Based Fund Suggestions',
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final s = MediaQuery.of(context).size;
    log('${Get.width} ${Get.height}');
    log('${s.width} ${s.height}');
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: w * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: w * 0.1),
                Icon(Icons.check_circle, color: Ucolors.success, size: 20),
                SizedBox(width: w * 0.03),
                Text(
                  text[index],
                  style: UTextStyles.subtitle1.copyWith(color: Ucolors.dark),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
