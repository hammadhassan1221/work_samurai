import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/providers/multi_providers.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        title: 'Work Samuri',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: Assets.muliRegular,
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.worker,
      ),
    );
  }
}