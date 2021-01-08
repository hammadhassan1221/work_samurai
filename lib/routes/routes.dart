
import 'package:work_samurai/screens/login/login.dart';
import 'package:work_samurai/screens/splash/splash.dart';
import 'package:work_samurai/screens/worker/worker.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String worker = '/worker';
  static const String home = '/home';

  static final routes = {
    splash: (context) => Splash(),
    login: (context) => Login(),
    worker: (context) => Worker(

    ),
  };
}