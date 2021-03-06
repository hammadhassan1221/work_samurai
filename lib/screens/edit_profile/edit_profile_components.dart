import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile_provider.dart';
import 'package:work_samurai/widgets/toast.dart';

class EditProfileComponents {
  Widget getUserImage({@required Function onPress,@required String imagePath, @required EditProfileProviders editProfileObj}) {
    return GestureDetector(
    onTap: (){
     // ApplicationToast.getSuccessToast(durationTime: 2, heading: "null", subHeading: "Hello");
      editProfileObj.getImage();
    },
      child: Center(
        child: Stack(
          children:<Widget>[

         Container(
              height: AppSizes.width*0.42,
              width: AppSizes.width*0.42,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: editProfileObj.userImage == null ? NetworkImage(
                   imagePath,
                  ) : FileImage(editProfileObj.userImage),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                color: Colors.black54,
                  border: Border.all(
                    color: AppColors.clr_bg_black,
                  )
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: AppSizes.width*0.3,top: 20),
                height: AppSizes.width * 0.13,
                width: AppSizes.width * 0.13,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.clr_bg_black,
                    )),
                child: Icon(
                  Icons.edit,
                  color: AppColors.clr_bg_black,
                )
            ),
            // Container(
            //   height: 20,
            //   margin: EdgeInsets.only(top: AppSizes.height*0.165,left:42),
            //     color: Colors.black54,
            //     child: Text(
            //       'edit image',
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     )
            // )
          ],
        ),
      ),
    );
  }


  Widget getInputField(
      {@required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required String text,
        @required String text1,
        @required String value,
        @required TextEditingController firstname,

       // @required TextEditingController controller,
        @required bool isPassword,
      }) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:TextField(
          controller: firstname,
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
          obscureText: isPassword,
           //controller: controller,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(
              fontSize: 15,
              color: AppColors.clr_bg_black2,
              fontFamily: 'MuliRegular',),
            border: InputBorder.none,
              contentPadding: EdgeInsets.all(12),
              /*suffixIcon: Padding(
                padding: EdgeInsets.all(15),
                child: Icon(Icons.arrow_forward_ios,size: 18,color: AppColors.clr_bg_black2,),
              )*/),
          ),

    );
  }

  Widget getVerificationContainer(
      {
        @required Function onPress,
        @required Color backgroundColor,
        @required Color borderColor,
        @required Color textColor,
        @required Color verifyColor,
        @required String text,
        @required String text1,
        @required TextEditingController controller,
        @required bool isPassword,
        @required IconData iconData,
        @required String verify,
      }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all( AppSizes.width*0.02),
        margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text /*?? "*/,style: TextStyle(color:textColor),),
                Text(text1 ?? "",style: TextStyle(color: AppColors.clr_bg_black2),),
              ],
            ),

            Container(

              child: Column(

                children: [
                  Text(verify,style:TextStyle(color: verifyColor)),
                  SizedBox(height: AppSizes.height*0.01,),
                  Icon(iconData,size: 17,color: AppColors.clr_bg_black2,),
                ],
              ),
            )
          ],
        )

      ),
    );
  }

  Widget getDescriptionContainer({@required String heading, @required String desc,@required controllor}){
    return Container(
      height: AppSizes.height*0.18,
      margin: EdgeInsets.only(top:AppSizes.height*0.015,left:AppSizes.width*0.03,right:AppSizes.width*0.03,),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.sign_field,
        ),
        borderRadius: BorderRadius.circular(5),
        color: AppColors.clr_bg,
      ),
      padding: EdgeInsets.only(left: AppSizes.width*0.03),
      child:TextField(
        controller: controllor,
        cursorColor: AppColors.clr_bg_black2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        //cursorHeight: 12,
        // controller: controller,
        decoration: InputDecoration(
          hintText: heading,

          hintStyle: TextStyle(fontSize: 18,
            color: AppColors.clr_bg_black,
            fontFamily: 'MuliRegular',),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
