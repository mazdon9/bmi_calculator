import 'package:bmi_calculator/components/app_button_icon.dart';
import 'package:bmi_calculator/components/app_text.dart';
import 'package:bmi_calculator/components/app_text_style.dart';
import 'package:bmi_calculator/contants/app_data.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int weight = 78;
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
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
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 21),
                    padding: EdgeInsets.only(bottom: 14),
                    width: 156,
                    // height: 190,
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: Column(
                        children: [
                          AppText(
                            title: 'Age',
                            style: AppTextStyle.textFont17W400,
                          ),
                          SizedBox(height: 3),
                          ValueListenableBuilder<int>(
                            valueListenable: age,
                            builder: (context, value, _) {
                              String title = value.toString();
                              return AppText(
                                title: title,
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
                                  icon:
                                      Icons
                                          .remove, // Replace with the desired icon
                                  onPressed: () {
                                    if (age.value > 0) {
                                      age.value--;
                                    }
                                  },
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(right: 28),
                                child: CustomIconButton(
                                  icon:
                                      Icons
                                          .add, // Replace with the desired icon
                                  onPressed: () {
                                    age.value++;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // WEIGHT BOX
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    padding: EdgeInsets.only(bottom: 14),
                    width: 156,
                    // height: 190,
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 27),
                      child: StatefulBuilder(
                        builder: (context, innerSetState) {
                          return Column(
                            children: [
                              AppText(
                                title: 'Weight',
                                style: AppTextStyle.textFont17W400,
                              ),
                              SizedBox(height: 3),
                              AppText(
                                title: weight.toString(),
                                style: AppTextStyle.textFontB537W700,
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 28),
                                    child: CustomIconButton(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        if (weight > 0) {
                                          innerSetState(() {
                                            weight--;
                                          });
                                        }
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(right: 28),
                                    child: CustomIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        innerSetState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
