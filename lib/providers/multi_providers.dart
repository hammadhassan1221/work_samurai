import 'package:provider/provider.dart';
import 'package:work_samurai/screens/forget_password/forget_password_provider.dart';

import 'package:work_samurai/screens/login/login_providers.dart';
import 'package:work_samurai/screens/sign_up/sign_up_providers.dart';
import 'package:work_samurai/screens/splash/splash_providers.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_provider.dart';
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
  ChangeNotifierProvider<SignUpProvider>(
    create: (_) => SignUpProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<GigsProvider>(
    create: (_) => GigsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ForgetPasswordProvider>(
    create: (_) => ForgetPasswordProvider(),
    lazy: true,
  ),
];