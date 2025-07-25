import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_images_path.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorPath.lavender,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 81, bottom: 59),
            child: AppText(title: 'BMiDO', style: AppTextStyle.textFontI30W800),
          ),
          Image.asset(
            AppImagesPath.manWithBicycleImg,
            width: (296 / 393) * size.width,
            height: (251 / 852) * size.height,
          ),
          Padding(
            padding: EdgeInsets.only(top: 95, right: 31, bottom: 15),
            child: AppText(
              title: 'Get Started with\nTracking Your Health!',
              style: AppTextStyle.textFontI25W700,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 58, right: 54, bottom: 38),
            child: AppText(
              title:
                  'Calculate your BMI and stay on top of your wellness journey, effortlessly.',
              style: AppTextStyle.textFont15W400,
            ),
          ),
          AppButton(
            content: 'Get Started',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.resultScreenRoute);
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
