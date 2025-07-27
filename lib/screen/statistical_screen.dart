import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:flutter/material.dart';

class StatisticalScreen extends StatelessWidget {
  const StatisticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 400,
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
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Statistical Screen', style: AppTextStyle.textFontM42W500),
              SizedBox(height: 20),
              Text(
                'Gender: ${gender.value ? 'Female' : 'Male'}',
                style: AppTextStyle.textFontM24W500,
              ),
              SizedBox(height: 20),
              Text('Age: ${age.value}', style: AppTextStyle.textFontM24W500),
              SizedBox(height: 20),
              Text(
                'Weight: ${weight.value} KG',
                style: AppTextStyle.textFontM24W500,
              ),
              SizedBox(height: 20),
              Text(
                'Height: ${(height.value) / 100} M',
                style: AppTextStyle.textFontM24W500,
              ),
              SizedBox(height: 20),
              Text(
                'Classification: ${getBmiClassification()}',
                style: AppTextStyle.textFontM24W500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
