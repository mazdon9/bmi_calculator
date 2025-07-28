import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:flutter/material.dart';

class SliderBoxWidget extends StatelessWidget {
  final String title;
  final ValueNotifier<int> valueNotifier;

  const SliderBoxWidget({
    super.key,
    required this.title,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 25, right: 30, left: 28),
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
                padding: EdgeInsets.zero,
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(title: "50 cm", style: AppTextStyle.textFont13W400),
              AppText(
                title: "300cm", // Placeholder for BMI value
                style: AppTextStyle.textFont13W400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
