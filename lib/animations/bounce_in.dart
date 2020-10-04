

import 'package:flutter/cupertino.dart';

class BounceInAnimation extends PageRouteBuilder {
  final Widget widget;

  BounceInAnimation({this.widget})
      : super(
      transitionDuration: Duration(milliseconds: 1500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child) {
        animation = CurvedAnimation(
            parent: animation, curve: Curves.bounceIn);

        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        return widget;
      });
}
