import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/sizes.dart';

class AppSettingsComponents{

Widget getSettingText({@required String text}){
  return Container(
    padding: EdgeInsets.only(left: AppSizes.width*0.03,right: AppSizes.width*0.03,),
    child: Text(text,
      style: TextStyle(
          fontSize: 15,
          fontFamily: 'MuliRegular'
      ),
    ),
  );
}
}