import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/background_check/background_check_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class BackgroundCheck extends StatefulWidget {
  @override
  _BackgroundCheckState createState() => _BackgroundCheckState();
}

class _BackgroundCheckState extends State<BackgroundCheck> {
  BackgroundCheckComponents _backgroundCheckComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backgroundCheckComponents = BackgroundCheckComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.clr_bg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.getAppBar(text: "Criminal Background Check", context: context),
                Expanded(child: ListView(children: [
                  _backgroundCheckComponents.getHeadings(text: "Upload Criminal Background Check"),
                  _backgroundCheckComponents.getBackgroundDetails(),
                  SizedBox(height: AppSizes.height*0.05,),
                  CommonWidgets.getSignUpButton(context: context, onPress: (){_settingModalBottomSheet(context);}, text: "Lodge New Police Check"),
                  SizedBox(height: AppSizes.height*0.0125,),
                  _backgroundCheckComponents.getExistingButton(context: context, onPress: (){}, text: "Upload Existing")

                ],)),

              ],
            ),
          ),
        ));
  }
}

_settingModalBottomSheet(context){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return Container(
          padding: EdgeInsets.only(top:AppSizes.height*0.015,right: AppSizes.width*0.05,left: AppSizes.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
                "Lodge New Police Work",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.clr_bg_black,
                  fontFamily: 'MuliBold',
                )
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top:AppSizes.height*0.025,),
                height: 100,
                width: 100,
                color: AppColors.clr_bg_black,

              ),
            ),
            Container(
              margin: EdgeInsets.only(top:AppSizes.height*0.025,),
              child: Text("An email has been sent with the lodgement information, alternatively, you can click on the following link to lodge a new criminal backgroundcheck.",
              style: TextStyle(
                color: AppColors.clr_bg_black,
                fontFamily: 'MuliSemiBold'
              ),),
            ),
            SizedBox(height: AppSizes.height*0.05,),
            CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Go to Lodgement")
          ],
        ),
        );
      }
  );
}