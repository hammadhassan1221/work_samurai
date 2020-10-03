import 'package:provider/provider.dart';
import 'package:work_samurai/screens/splash/splash_providers.dart';

final multiProviders=[
  ChangeNotifierProvider<SplashProvider>(
      create: (_) => SplashProvider(),
      lazy: true,
    ),
];