import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/screen/Results_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6C63FF),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 81),
              child: AppText(
                title: 'BMiDO',
                style: AppTextStyle.textFontI30W800,
              ),
            ),
            SizedBox(height: 59),
            Container(
              padding: EdgeInsets.only(left: 58, right: 39),
              child: Image.asset('assets/images/man_with_bicycle_img.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 95, right: 31),
              child: AppText(
                title: 'Get Started with\nTracking Your Health!',
                style: AppTextStyle.textFontI25W700,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 58, right: 54),
              child: AppText(
                title:
                    'Calculate your BMI and stay on top of your wellness journey, effortlessly.',
                style: AppTextStyle.textFont15W400,
              ),
            ),
            SizedBox(height: 38),
            AppButton(
              content: 'Get Started',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsScreen()),
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
