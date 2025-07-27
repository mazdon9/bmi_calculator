import 'package:flutter/material.dart';

ValueNotifier<int> age = ValueNotifier<int>(30);
ValueNotifier<int> weight = ValueNotifier<int>(78);
ValueNotifier<int> height = ValueNotifier<int>(175);
ValueNotifier<bool> gender = ValueNotifier<bool>(
  false,
); // false = Male, true = Female
double get bmiIndex => weight.value / (height.value / 100);

String getBmiClassification() {
  final bmi = bmiIndex;
  if (bmi < 18.5) {
    return 'UNDERWWEIGHT';
  } else if (bmi >= 18.5 && bmi < 24.9) {
    return 'NORMAL WEIGHT';
  } else if (bmi >= 25 && bmi < 29.9) {
    return 'OVERWEIGHT';
  } else {
    return 'OBESITY';
  }
}
