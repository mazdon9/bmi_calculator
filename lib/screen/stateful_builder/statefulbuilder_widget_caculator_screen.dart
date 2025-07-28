// calculator_statefulbuilder.dart

import 'package:flutter/material.dart';

class CalculatorWithStatefulBuilder extends StatelessWidget {
  const CalculatorWithStatefulBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    int age = 30;
    int weight = 78;
    int height = 175;
    bool isMale = true;

    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator (StatefulBuilder)")),
      body: StatefulBuilder(
        builder: (context, setState) {
          double bmi = weight / ((height / 100) * (height / 100));
          return Column(
            children: [
              Text("Age: $age"),
              Text("Weight: $weight"),
              Text("Height: $height cm"),
              Switch(
                value: isMale,
                onChanged: (val) => setState(() => isMale = val),
              ),
              Slider(
                value: height.toDouble(),
                min: 50,
                max: 250,
                onChanged: (val) => setState(() => height = val.toInt()),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint("BMI: $bmi");
                  // Navigator.push...
                },
                child: Text("Calculate BMI"),
              ),
            ],
          );
        },
      ),
    );
  }
}
