

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          color: AppColors.clr_bg_grey.withOpacity(0.5),
          child: Center(
            child: Container(
              height: AppSizes.height*0.30,
              width: AppSizes.width*0.50,
              decoration: BoxDecoration(
               // shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/json/resolve",
                  ),
                  fit: BoxFit.fill,
                  scale: 1.3,
                ),
              ),
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
