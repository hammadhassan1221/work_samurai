import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/sizes.dart';

class SignUpComponents{
  Widget getImageContainer(String imagePath, double height, double width) {
    return Container(
        child: Image.asset(imagePath, width: width, height: height));
  }

  Widget getButton(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required Function onPress}) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        width: AppSizes.width * 0.8,
        height: AppSizes.height * 0.07,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: AppSizes.height * 0.02,
          left: AppSizes.width * 0.08,
          right: AppSizes.width * 0.08,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

   Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required String imagePath,
       }) {
    return Container(
      width: AppSizes.width*0.8,
      height: AppSizes.height*0.07,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top:AppSizes.height*0.008,left:AppSizes.height*0.03,right:AppSizes.height*0.03,),
      decoration: BoxDecoration(
        border: Border(
          bottom:BorderSide(color: borderColor,width: 1)
        ),
        color: backgroundColor,
      ),

      child: Row(
        children: [
          Image.asset(
            imagePath,height: 25,width: 25,
          ),
          SizedBox(width: AppSizes.width*0.03,),
          //remove expanded and their will be exception because text field not direct child of container and if in row exception of unbounded width
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: text,
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: "Muli-Regular",
                    decoration: TextDecoration.none,
                  )),
            ),
          ),
        ],
      )
    );
  }

}