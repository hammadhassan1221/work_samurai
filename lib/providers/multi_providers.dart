import 'package:provider/provider.dart';
import 'package:work_samurai/screens/business/application/application_provider.dart';
import 'package:work_samurai/screens/business/home/home_provider.dart';
import 'package:work_samurai/screens/business/home/pages/tracks/track_provider.dart';
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
  ChangeNotifierProvider<HomeProvider>(
    create: (_) => HomeProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<TracksProvider>(
    create: (_) => TracksProvider(),
    lazy: true,
  ),

  ChangeNotifierProvider<ApplicationProvider>(
    create: (_) => ApplicationProvider(),
    lazy: true,
  ),
];