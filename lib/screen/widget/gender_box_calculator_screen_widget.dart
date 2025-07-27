import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:flutter/material.dart';

class GenderBoxCalculatorScreenWidget extends StatelessWidget {
  const GenderBoxCalculatorScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(title: "Gender", style: AppTextStyle.textFont17W400),
        SizedBox(height: 16),
        ValueListenableBuilder<bool>(
          valueListenable: gender,
          builder: (context, isMale, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title: "Male",
                  style: AppTextStyle.textFont17W400.copyWith(
                    color:
                        isMale
                            ? AppColorPath.lavender.withAlpha(100)
                            : AppColorPath.darkBlue,
                  ),
                ),
                const SizedBox(width: 18),
                SizedBox(
                  width: 135,
                  height: 41,
                  child: Transform.scale(
                    scale: 1.6,
                    child: Switch(
                      value: isMale,
                      activeColor: AppColorPath.darkBlue,
                      onChanged: (value) {
                        gender.value = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                AppText(
                  title: "Female",
                  style: AppTextStyle.textFont17W400.copyWith(
                    color:
                        !isMale
                            ? AppColorPath.lavender.withAlpha(100)
                            : AppColorPath.darkBlue,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
