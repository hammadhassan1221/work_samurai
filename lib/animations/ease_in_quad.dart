import 'package:flutter/material.dart';

class EaseInQuad extends PageRouteBuilder {
  final Widget widget;

  EaseInQuad({this.widget})
      : super(
      transitionDuration: Duration(milliseconds: 1500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child) {
        animation = CurvedAnimation(
            parent: animation, curve: Curves.easeInQuad);

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
