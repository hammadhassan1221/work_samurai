import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/screens/splash/splash.dart';

class Routes {
  static const String splash = '/';
  static const String login = 'login';

  static final routes = {
    splash: (context) => Splash(),
    login: (context) => Login(),
  };
}