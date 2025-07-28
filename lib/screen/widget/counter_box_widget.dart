import 'package:bmi_calculator/components/app_button_icon.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:flutter/material.dart';

class CounterBoxWidget extends StatelessWidget {
  final String title;
  final ValueNotifier<int> valueNotifier;
  const CounterBoxWidget({
    super.key,
    required this.title,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(bottom: 14),
      width: (size.width - 30 * 2 - 21) / 2,
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
