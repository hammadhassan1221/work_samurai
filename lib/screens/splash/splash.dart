// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/splash/splash_components.dart';
import 'package:work_samurai/screens/splash/splash_providers.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SplashProvider _provider;
  SplashComponents _components;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String text = "";

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<SplashProvider>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await _provider.init(context: context);
    });
    //_provider.navigateToNextRoute(context);
    _components = SplashComponents();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    PreferenceUtils.init();
    PreferenceUtils.setInt("counter", 1);
    AppSizes.initializeSize(context);
    Provider.of<SplashProvider>(context, listen: true);
    _provider.initializeResources(context);
    return Scaffold(
      body: Stack(
        children: [
          _components.getMainContainer(Assets.logo, 400, 400),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              _provider.versionNumber,
            ),
          ),
        ],
      ),
    );
  }
}
