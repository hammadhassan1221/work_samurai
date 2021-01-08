import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/location_details/location_details_components.dart';
import 'package:work_samurai/screens/location_details/location_details_providers.dart';
import 'package:work_samurai/widgets/widgets.dart';

class LocationDetails extends StatefulWidget {
  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  LocationDetailsComponents _locationDetailsComponents;
  LocationDetailsProviders _locationDetailsProviders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _locationDetailsComponents = LocationDetailsComponents();
    _locationDetailsProviders =
        Provider.of<LocationDetailsProviders>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationDetailsProviders>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
          children: [
            CommonWidgets.getAppBar(text: "Location Details", context: context),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            _locationDetailsComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "Address 1",
                //controller: _accountNumber,
                isPassword: false),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            _locationDetailsComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "Address 2",
                //controller: _accountNumber,
                isPassword: false),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            _locationDetailsComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "City",
                //controller: _accountNumber,
                isPassword: false),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: _locationDetailsComponents.getInputField(
                      backgroundColor: AppColors.clr_bg,
                      borderColor: AppColors.sign_field,
                      textColor: AppColors.clr_bg_black,
                      text: "City",
                      //controller: _accountNumber,
                      isPassword: false),
                ),
                Expanded(
                  flex: 1,
                  child: _locationDetailsComponents.getInputField(
                      backgroundColor: AppColors.clr_bg,
                      borderColor: AppColors.sign_field,
                      textColor: AppColors.clr_bg_black,
                      text: "Post Code",
                      //controller: _accountNumber,
                      isPassword: false),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
