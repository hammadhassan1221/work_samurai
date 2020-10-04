import 'package:flutter/material.dart';

class BounceInOutAnimation extends PageRouteBuilder {
  final Widget widget;

  BounceInOutAnimation({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 1500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.bounceInOut,
              );

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
