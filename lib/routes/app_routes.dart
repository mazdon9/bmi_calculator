import 'package:bmi_calculator/screen/results_screen.dart';
import 'package:bmi_calculator/screen/splash_screen.dart';

class AppRoutes {
  static final String splashScreenRoute = 'splash-screen';
  static final String resultScreenRoute = 'result-screen';

  static final routes = {
    splashScreenRoute: (context) => SplashScreen(),
    resultScreenRoute: (context) => ResultsScreen(),
  };
}
