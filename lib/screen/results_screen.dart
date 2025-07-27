import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ResultSreen extends StatelessWidget {
  const ResultSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 54),
              child: AppText(
                title: 'BMI CALCULATOR',
                style: AppTextStyle.textFont17W400,
              ),
            ),
            SizedBox(height: 67),
            AppText(
              title: "Body Mass Index",
              style: AppTextStyle.textFont27W400,
            ),
            SizedBox(height: 42),
            Container(
              padding: EdgeInsets.only(bottom: 24),
              width: (333 / 393) * MediaQuery.of(context).size.width,
              // height: 333,
              decoration: BoxDecoration(
                color: Colors.white,
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
                          text: "${bmiIndex.toInt()}",
                          style: AppTextStyle.textFontB140W700,
                        ),
                        TextSpan(
                          text: ".",
                          style: AppTextStyle.textFontM42W500,
                        ),
                        TextSpan(
                          text: bmiIndex
                              .toString()
                              .split('.')[1]
                              .substring(0, 2),
                          style: AppTextStyle.textFontM42W500,
                        ),
                      ],
                    ),
                  ),
                  AppText(
                    title: getBmiClassification(),
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
            CalculatorSaveButton(
              content: "Save the Results",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.StatisticalScreenRoute,
                  arguments: {
                    'age': age.value,
                    'weight': weight.value,
                    'height': height.value,
                    'gender': gender.value,
                    'bmi': bmiIndex.toStringAsFixed(2),
                    'classification': getBmiClassification(),
                  },
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
