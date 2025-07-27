import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_button_icon.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:bmi_calculator/screen/widget/gender_box_calculator_screen_widget.dart';
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
              CounterBox(title: "Age", valueNotifier: age),
              // WEIGHT BOX
              CounterBox(title: "Weight", valueNotifier: weight),
            ],
          ),
          SizedBox(height: 23),
          // HEIGHT (CM) SLIDER BOX
          SliderBox(title: "Height (CM)", valueNotifier: height),
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
            child: GenderBoxCalculatorScreenWidget(),
          ),
          SizedBox(height: 31),
          CalculatorSaveButton(
            content: 'Calculate BMI',
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.ResultScreenRoute,
                arguments: {
                  'age': age.value,
                  'weight': weight.value,
                  'height': height.value / 100,
                  'gender': gender.value ? 'Male' : 'Female',
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

class CounterBox extends StatelessWidget {
  final String title;
  final ValueNotifier<int> valueNotifier;
  const CounterBox({
    super.key,
    required this.title,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(bottom: 14),
      width: 156,
      // height: 190,
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
      child: Padding(
        padding: EdgeInsets.only(top: 27),
        child: Column(
          children: [
            AppText(title: title, style: AppTextStyle.textFont17W400),
            SizedBox(height: 3),
            ValueListenableBuilder<int>(
              valueListenable: valueNotifier,
              builder: (context, value, _) {
                return AppText(
                  title: value.toString(),
                  style: AppTextStyle.textFontB537W700,
                );
              },
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: CustomIconButton(
                    icon: Icons.remove,
                    onPressed: () {
                      if (valueNotifier.value > 0) {
                        valueNotifier.value--;
                      }
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 28),
                  child: CustomIconButton(
                    icon: Icons.add,
                    onPressed: () {
                      valueNotifier.value++;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliderBox extends StatelessWidget {
  final String title;
  final ValueNotifier<int> valueNotifier;

  const SliderBox({
    super.key,
    required this.title,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 25),
      width: (333 / 393) * size.width,
      // height: (183 / 852) * size.height,
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
          Center(
            child: AppText(title: title, style: AppTextStyle.textFont17W400),
          ),
          SizedBox(height: 3),
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, _) {
              return AppText(
                title: value.toString(),
                style: AppTextStyle.textFontB537W700,
              );
            },
          ),
          // SizedBox(height: 12),
          ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, _) {
              return Slider(
                activeColor: AppColorPath.lavender,
                value: value.toDouble(),
                min: 50,
                max: 300,
                divisions: 250,
                label: value.toString(),
                onChanged: (newValue) {
                  valueNotifier.value = newValue.toInt();
                },
              );
            },
          ),
          // SizedBox(height: 19),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 28),
                child: AppText(
                  title: "50 cm",
                  style: AppTextStyle.textFont13W400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: AppText(
                  title: "300cm", // Placeholder for BMI value
                  style: AppTextStyle.textFont13W400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
