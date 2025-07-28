import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:bmi_calculator/screen/set_state/setstate_widget_caculator_screen.dart';
import 'package:bmi_calculator/screen/stateful_builder/statefulbuilder_widget_caculator_screen.dart';
import 'package:flutter/material.dart';

class StatisticalScreen extends StatelessWidget {
  const StatisticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final age = args['age'];
    final gender = args['gender'];
    final weight = args['weight'];
    final height = args['height'];
    return Scaffold(
      backgroundColor: AppColorPath.lavender,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 400,
              decoration: BoxDecoration(
                color: AppColorPath.white,

                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('STATISTICAL', style: AppTextStyle.textFontM42W500),
                  SizedBox(height: 20),
                  Text('Gender: $gender', style: AppTextStyle.textFontM24W500),
                  SizedBox(height: 20),
                  Text('AGE: $age', style: AppTextStyle.textFontM24W500),
                  SizedBox(height: 20),
                  Text(
                    'WEIGHT: $weight KG',
                    style: AppTextStyle.textFontM24W500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'HEIGHT: $height M',
                    style: AppTextStyle.textFontM24W500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'CLASSIFICATION: ${getBmiClassification(bmiIndex: bmiIndex)}',
                    style: AppTextStyle.textFontM24W500,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                AppButton(
                  content: 'Go to Screen setState',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculatorScreenSetState(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                AppButton(
                  content: 'Go to Screen Statefulbuilder',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculatorWithStatefulBuilder(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
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
