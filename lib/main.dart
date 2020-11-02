
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/routes/routes.dart';

import 'providers/multi_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        title: 'Work Samurai',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.splash,
      ),
    );
  }
}