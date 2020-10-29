

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
              decoration: BoxDecoration(
                color: AppColors.transparentColor.withOpacity(0.9),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              padding: EdgeInsets.all(
                AppSizes.width * 0.01,
              ),
              margin: EdgeInsets.all(
                AppSizes.width * 0.40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: AppSizes.width * 0.07,
                    height: AppSizes.width * 0.07,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.clr_white.withOpacity(0.9),
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.clr_bg_grey,
                      ),
                    ),
                  ),
                ],
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
