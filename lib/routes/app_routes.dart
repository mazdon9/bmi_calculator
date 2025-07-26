import 'package:bmi_calculator/screen/calculator_screen.dart';
import 'package:bmi_calculator/screen/splash_screen.dart';

class AppRoutes {
  static final String CalculartorScreenRoute = 'splash-screen';
  static final String resultScreenRoute = 'result-screen';

  static final routes = {
    CalculartorScreenRoute: (context) => CalculartorScreen(),
    resultScreenRoute: (context) => ResultsScreen(),
  };
}
