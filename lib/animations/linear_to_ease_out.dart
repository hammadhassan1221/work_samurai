import 'package:flutter/material.dart';

class LinearToEaseOutAnimation extends PageRouteBuilder {
  final Widget widget;

  LinearToEaseOutAnimation({this.widget})
      : super(
      transitionDuration: Duration(milliseconds: 900),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child) {
        animation = CurvedAnimation(
            parent: animation, curve: Curves.linearToEaseOut);

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
