import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ResultSreen extends StatelessWidget {
  const ResultSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final age = args['age'];
    final gender = args['gender'];
    final weight = args['weight'];
    final height = args['height'];

    double bmiIndex = weight / height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 54, bottom: 67),
            child: AppText(
              title: 'BMI CALCULATOR',
              style: AppTextStyle.textFont17W400,
            ),
          ),
          AppText(title: "Body Mass Index", style: AppTextStyle.textFont27W400),
          Container(
            padding: EdgeInsets.only(bottom: 24),
            margin: EdgeInsets.only(top: 42, right: 30, left: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColorPath.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 56),
                  child: AppText(
                    title: "BMI Results",
                    style: AppTextStyle.textFont32W400,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        /// bmi index
                        text: "${bmiIndex.toInt()}",
                        style: AppTextStyle.textFontB140W700,
                      ),
                      TextSpan(text: ".", style: AppTextStyle.textFontM42W500),
                      TextSpan(
                        /// bmi index
                        text: bmiIndex.toString().split('.')[1].substring(0, 2),
                        style: AppTextStyle.textFontM42W500,
                      ),
                    ],
                  ),
                ),
                AppText(
                  /// result
                  title: getBmiClassification(bmiIndex: bmiIndex),
                  style: AppTextStyle.textFontM24W500,
                ),
                SizedBox(height: 18.5),
                AppText(
                  title:
                      'Underweight: BMI less than 18.5\nNormal weight: BMI 18.5 to 24.9\nOverweight: BMI 25 to 29.9\nObesity: 30 to 40',
                  style: AppTextStyle.textFontM13W500,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 77),
          AppButton(
            content: "Save the Results",
            textColor: AppColorPath.white,
            backgroundColor: AppColorPath.lavender,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.statisticalScreenRoute,
                arguments: {
                  'age': age,
                  'weight': weight,
                  'height': height,
                  'gender': gender,
                  'bmi': bmiIndex.toStringAsFixed(2),
                },
              );
            },
          ),
          Spacer(),
        ],
      ),
    );
  }

  String getBmiClassification({required double bmiIndex}) {
    final bmi = bmiIndex;
    if (bmi < 18.5) {
      return 'UNDERWWEIGHT';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'NORMAL WEIGHT';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESITY';
    }
  }
}
