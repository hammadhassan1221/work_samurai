
import 'package:flutter/material.dart';
import 'package:work_samurai/res/sizes.dart';

Widget verticalSpacer(double value) => SizedBox(
      height: AppSizes.heightRatio * value,
    );

Widget horizontalSpacer(double value) => SizedBox(
      width: AppSizes.widthRatio * value,
    );

double verticalValue(double value) => AppSizes.heightRatio * value;

double horizontalValue(double value) =>  AppSizes.widthRatio * value;