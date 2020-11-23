import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/settings/settings_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsComponents _settingsComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _settingsComponents =  SettingsComponents();
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
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CommonWidgets.getAppBar(text: "Settings", onPress: (){Navigator.pop(context);}, imagepath: Assets.barArrow),
                    SizedBox(height: AppSizes.height*0.05,),
                    _settingsComponents.getUserImage(onPress: (){},iconData: Icons.camera_alt,imagePath: Assets.support),
                    SizedBox(height: AppSizes.height*0.05,),
                    _settingsComponents.getInputContainer(heading: "First Name", iconData: Icons.keyboard_arrow_down_outlined, onPress: (){}),
                    SizedBox(height: AppSizes.height*0.025,),
                    _settingsComponents.getInputContainer(heading: "Address", iconData: Icons.keyboard_arrow_down_outlined, onPress: (){}),
                    SizedBox(height: AppSizes.height*0.025,),
                    _settingsComponents.getInputContainer(heading: "Description", iconData: Icons.keyboard_arrow_down_outlined, onPress: (){}),
                    SizedBox(height: AppSizes.height*0.025,),
                    _settingsComponents.getInputContainer(heading: "Password", iconData: Icons.keyboard_arrow_down_outlined, onPress: (){}),
                    _settingsComponents.getSignUpButton(context: context, onPress: (){}, text: "Update")

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
