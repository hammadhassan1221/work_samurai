import 'package:provider/provider.dart';
import 'package:work_samurai/screens/login/login_providers.dart';
import 'package:work_samurai/screens/splash/splash_providers.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';

final multiProviders=[
  ChangeNotifierProvider<SplashProvider>(
      create: (_) => SplashProvider(),
      lazy: true,
    ),
  ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<WorkerProvider>(
    create: (_) => WorkerProvider(),
    lazy: true,
  ),
];