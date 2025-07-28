import 'package:bmi_calculator/screen/calculator_screen.dart';
import 'package:bmi_calculator/screen/results_screen.dart';
import 'package:bmi_calculator/screen/splash_screen.dart';
import 'package:bmi_calculator/screen/statistical_screen.dart';

class AppRoutes {
  static final String spashScreenRouter = 'splash-screen';
  static final String calculatorScreenRoute = 'calculator-screen';
  static final String resultScreenRoute = 'results-screen';
  static final String statisticalScreenRoute = 'Statistical-screen';

  static final routes = {
    spashScreenRouter: (context) => SplashScreen(),
    calculatorScreenRoute: (context) => CalculatorScreen(),
    resultScreenRoute: (context) => ResultSreen(),
    statisticalScreenRoute: (context) => StatisticalScreen(),
  };
}
