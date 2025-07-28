import 'package:bmi_calculator/components/app_button.dart';
import 'package:bmi_calculator/components/app_button_icon.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CalculatorScreenSetState extends StatefulWidget {
  const CalculatorScreenSetState({super.key});

  @override
  State<CalculatorScreenSetState> createState() =>
      _CalculatorScreenSetStateState();
}

class _CalculatorScreenSetStateState extends State<CalculatorScreenSetState> {
  int age = 20;
  int weight = 60;
  int height = 170;
  bool isMale = true;

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
              CounterBox(
                title: "Age",
                value: age,
                onChanged: (v) => setState(() => age = v),
              ),
              CounterBox(
                title: "Weight",
                value: weight,
                onChanged: (v) => setState(() => weight = v),
              ),
            ],
          ),
          SizedBox(height: 23),
          SliderBox(
            title: "Height (CM)",
            value: height,
            onChanged: (v) => setState(() => height = v),
          ),
          SizedBox(height: 23),
          Container(
            width: (333 / 393) * size.width,
            padding: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
              color: AppColorPath.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: GenderOption(
              title: 'Female',
              gender: !isMale,
              onTap: () {
                setState(() => isMale = !isMale);
              },
            ),
          ),

          SizedBox(height: 31),
          CalculatorSaveButton(
            content: 'Calculate BMI',
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.ResultScreenRoute,
                arguments: {
                  'age': age,
                  'weight': weight,
                  'height': height / 100,
                  'gender': isMale ? 'Male' : 'Female',
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CounterBox extends StatelessWidget {
  final String title;
  final int value;
  final ValueChanged<int> onChanged;

  const CounterBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(bottom: 14),
      width: 156,
      decoration: BoxDecoration(
        color: AppColorPath.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
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
            AppText(
              title: value.toString(),
              style: AppTextStyle.textFontB537W700,
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
                      if (value > 0) onChanged(value - 1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 28),
                  child: CustomIconButton(
                    icon: Icons.add,
                    onPressed: () => onChanged(value + 1),
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
  final int value;
  final ValueChanged<int> onChanged;

  const SliderBox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 25),
      width: (333 / 393) * size.width,
      decoration: BoxDecoration(
        color: AppColorPath.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          AppText(title: title, style: AppTextStyle.textFont17W400),
          SizedBox(height: 3),
          AppText(
            title: value.toString(),
            style: AppTextStyle.textFontB537W700,
          ),
          Slider(
            activeColor: AppColorPath.lavender,
            value: value.toDouble(),
            min: 50,
            max: 300,
            divisions: 250,
            label: value.toString(),
            onChanged: (newValue) => onChanged(newValue.toInt()),
          ),
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
                  title: "300 cm",
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

class GenderOption extends StatelessWidget {
  final String title;
  final bool gender;
  final VoidCallback onTap;

  const GenderOption({
    super.key,
    required this.title,
    required this.gender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title: "Male",
            style: AppTextStyle.textFont17W400.copyWith(
              color:
                  gender
                      ? AppColorPath.lavender.withAlpha(100)
                      : AppColorPath.darkBlue,
            ),
          ),
          const SizedBox(width: 18),
          SizedBox(
            width: 60,
            height: 30,
            child: Switch(
              value: gender,
              activeColor: AppColorPath.darkBlue,
              inactiveThumbColor: AppColorPath.lavender,
              onChanged: (_) => onTap(),
            ),
          ),
          const SizedBox(width: 18),
          AppText(
            title: "Female",
            style: AppTextStyle.textFont17W400.copyWith(
              color:
                  !gender
                      ? AppColorPath.lavender.withAlpha(100)
                      : AppColorPath.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
