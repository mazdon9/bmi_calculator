import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 54),
              child: AppText(
                title: 'BMI CALCULATOR',
                style: AppTextStyle.textFont17W400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
