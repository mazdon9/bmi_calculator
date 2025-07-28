import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:bmi_calculator/screen/without_screen/setstate_widget_caculator_screen.dart';
import 'package:bmi_calculator/screen/without_screen/statefulbuilder_widget_caculator_screen.dart';
import 'package:flutter/material.dart';

class StatisticalScreen extends StatelessWidget {
  const StatisticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'Gender: ${gender.value ? 'Female' : 'Male'}',
                    style: AppTextStyle.textFontM24W500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'AGE: ${age.value}',
                    style: AppTextStyle.textFontM24W500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'WEIGHT: ${weight.value} KG',
                    style: AppTextStyle.textFontM24W500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'HEIGHT: ${(height.value) / 100} M',
                    style: AppTextStyle.textFontM24W500,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'CLASSIFICATION: ${getBmiClassification()}',
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
}
