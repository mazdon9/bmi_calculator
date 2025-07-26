import 'package:flutter/material.dart';

ValueNotifier<int> age = ValueNotifier<int>(30);
ValueNotifier<int> weight = ValueNotifier<int>(78);
ValueNotifier<int> height = ValueNotifier<int>(175);
ValueNotifier<bool> gender = ValueNotifier<bool>(
  false,
); // false = Male, true = Female
