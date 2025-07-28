import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:bmi_calculator/screen/widget/counter_box_widget.dart';
import 'package:bmi_calculator/screen/widget/gender_box_widget.dart';
import 'package:bmi_calculator/screen/widget/slider_box_widget.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 54),
            child: AppText(
              title: 'BMI CALCULATOR',
              style: AppTextStyle.textFont17W400,
            ),
          ),
          SizedBox(height: 39),

          Row(
            children: [
              // AGE BOX
              CounterBoxWidget(title: "Age", valueNotifier: age),
              // WEIGHT BOX
              CounterBoxWidget(title: "Weight", valueNotifier: weight),
            ],
          ),
          SizedBox(height: 23),
          // HEIGHT (CM) SLIDER BOX
          SliderBoxWidget(title: "Height (CM)", valueNotifier: height),
          SizedBox(height: 23),
          // GEMDER SELECTION BOX
          Container(
            width: (333 / 393) * size.width,
            padding: EdgeInsets.only(top: 25, bottom: 32),
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
            child: GenderBoxWidget(),
          ),
          SizedBox(height: 31),
          AppButton(
            content: 'Calculate BMI',
            textColor: AppColorPath.white,
            backgroundColor: AppColorPath.lavender,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.resultScreenRoute,
                arguments: {
                  'age': age.value,
                  'weight': weight.value,
                  'height': height.value / 100,
                  'gender': gender.value ? 'Female' : 'Male',
                },
              );
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
