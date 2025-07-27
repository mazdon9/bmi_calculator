import 'package:bmi_calculator/screen/calculator_screen.dart';
import 'package:bmi_calculator/screen/results_screen.dart';
import 'package:bmi_calculator/screen/splash_screen.dart';
import 'package:bmi_calculator/screen/statistical_screen.dart';

class AppRoutes {
  static final String SpashScreenRouter = 'splash-screen';
  static final String CalculatorScreenRoute = 'calculator-screen';
  static final String ResultScreenRoute = 'results-screen';
  static final String StatisticalScreenRoute = 'Statistical-screen';

  static final routes = {
    SpashScreenRouter: (context) => SplashScreen(),
    CalculatorScreenRoute: (context) => CalculatorScreen(),
    ResultScreenRoute: (context) => ResultSreen(),
    StatisticalScreenRoute: (context) => StatisticalScreen(),
  };
}
