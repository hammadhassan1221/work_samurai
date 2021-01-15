import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:work_samurai/res/assets.dart';

import '../res/colors.dart';
import '../res/sizes.dart';

class Loader {
  showLoader({
    BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Material(
          color: AppColors.clr_bg_grey.withOpacity(0.4),
          child: Center(
            child: Container(
              height: AppSizes.height * 0.30,
              width: AppSizes.width * 0.50,
              child: Lottie.asset(Assets.loader),
            ),
          ),
        );
      },
    );
  }

  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}
