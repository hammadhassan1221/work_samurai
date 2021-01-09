import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

class CommonWidgets {
  static Widget getRow(String text, bool value, Function onPress) {
    return Container(
        margin: EdgeInsets.only(top: AppSizes.height * 0.01),
        padding: EdgeInsets.only(
          left: AppSizes.width * 0.03,
          right: AppSizes.width * 0.03,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: AppColors.clr_bg_black,
                  fontSize: 15,
                  fontFamily: 'MuliRegular'),
            ),
            CupertinoSwitch(
                activeColor: Colors.lightGreenAccent,
                value: value,
                onChanged: onPress),
          ],
        ));
  }

  static Widget getAvailability(
      {@required String text1,
      @required String text,
      @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.05,
                width: AppSizes.width * 0.03,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.clr_green,
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Text(
                text1,
                style: TextStyle(
                    color: AppColors.clr_bg_black,
                    fontSize: 16,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.clr_bg_black,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
        ],
      ),
    );
  }

  static Widget getAvailability2(
      {@required String text1,
      @required String text,
      @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: AppSizes.height * 0.05,
                width: AppSizes.width * 0.03,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.clr_bg_black,
                ),
              ),
              SizedBox(
                width: AppSizes.width * 0.03,
              ),
              Text(
                text1,
                style: TextStyle(
                    color: AppColors.clr_bg_black,
                    fontSize: 16,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.clr_bg_black,
                    fontFamily: 'MuliRegular'),
              )
            ],
          ),
        ],
      ),
    );
  }

  static Widget getSignUpButton({
    @required BuildContext context,
    @required Function onPress,
    @required String text,
  }) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          splashColor: AppColors.clr_white,
          child: Container(
            margin: EdgeInsets.only(
              left: AppSizes.width * 0.03,
              right: AppSizes.width * 0.03,
            ),
            alignment: Alignment.center,
            height: AppSizes.height * 0.08,
            width: AppSizes.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5,
              ),
              border: Border.all(
                color: AppColors.clr_bg_black,
              ),
              color: AppColors.clr_bg_black,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'MuliRegular',
                    color: AppColors.clr_white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget getInputField({
    @required Color backgroundColor,
    @required Color borderColor,
    @required Color textColor,
    @required String text,
    @required String imagePath,
    @required TextEditingController controller,
    @required bool isPassword,
  }) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(
          top: AppSizes.height * 0.015,
          left: AppSizes.width * 0.03,
          right: AppSizes.width * 0.03,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        child: TextField(
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(
                fontSize: 12,
                color: AppColors.clr_bg_black2,
                fontFamily: 'MuliRegular',
              ),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.all(AppSizes.width * 0.03),
                child: Image.asset(imagePath, height: 25, width: 25),
              )),
        ));
  }
  static Widget getInputField1({
    @required Color backgroundColor,
    @required Color borderColor,
    @required Color textColor,
    @required String text,
    @required String imagePath,
    @required TextEditingController controller,
    @required bool isPassword,
  }) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(
          top: AppSizes.height * 0.015,
          left: AppSizes.width * 0.07,
          right: AppSizes.width * 0.07,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        child: TextField(
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(
                fontSize: 12,
                color: AppColors.clr_bg_black2,
                fontFamily: 'MuliRegular',
              ),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.all(AppSizes.width * 0.03),
                child: Image.asset(imagePath, height: 25, width: 25),
              )),
        ));
  }

  static Widget phoneField(
      {@required Color backgroundColor,
      @required Color borderColor,
      @required Color textColor,
      @required String text,
      @required IconData iconData,
      @required TextEditingController controller,
      @required bool isPassword,
      e}) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(
          left: AppSizes.height * 0.03,
          right: AppSizes.height * 0.03,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        child: TextField(
          cursorColor: AppColors.clr_bg_black2,
          //cursorHeight: 12,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(
                fontSize: 12,
                color: AppColors.clr_bg_black2,
                fontFamily: 'MuliRegular',
              ),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.all(AppSizes.width * 0.03),
                child: Icon(
                  iconData,
                  color: AppColors.clr_bg_black2,
                ),
              )),
        ));
  }

  static Widget getAppBar(
      {@required String text, @required BuildContext context}) {
    return Container(
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.clr_white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSizes.width * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                Assets.barArrow,
                height: 20,
                width: 20,
              )),
          SizedBox(
            width: AppSizes.width * 0.02,
          ),
          Container(
            padding: EdgeInsets.only(bottom: AppSizes.width * 0.01),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.clr_bg_black,
                decoration: TextDecoration.none,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                fontFamily: 'MuliSemiBold',
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget getAppBarWithout({
    @required String text,
  }) {
    return Container(
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: AppColors.clr_white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSizes.width * 0.038),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 22,
              fontFamily: 'MuliBold'),
        ),
      ),
    );
  }

  static Widget getGigsAppBar({
    @required String text,
  }) {
    return Container(
      width: AppSizes.width,
      color: AppColors.clr_white,
      padding: EdgeInsets.all(AppSizes.width * 0.038),
      child: Container(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          text,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 22,
              fontFamily: 'MuliBold'),
        ),
      ),
    );
  }

  static Widget getSupportContainer(
      {@required String imagePath,
      @required String heading,
      @required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
            left: AppSizes.width * 0.03, right: AppSizes.width * 0.03),
        height: AppSizes.height * 0.12,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 0.5,
                blurRadius: 0.5,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            color: AppColors.clr_bg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.clr_bg_grey,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                ),
                SizedBox(
                  width: AppSizes.width * 0.03,
                ),
                Text(
                  heading,
                  style: TextStyle(
                    color: AppColors.clr_bg_black,
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontFamily: 'MuliBold',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget getAlertContainer({@required Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: AppSizes.width,
        padding: EdgeInsets.all(AppSizes.width * 0.03),
        color: Colors.orangeAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Profile Inactive",
              style: TextStyle(
                  color: AppColors.clr_white,
                  fontSize: 14,
                  fontFamily: 'MuliSemiBold',
              ),
            ),
            SizedBox(
              height: AppSizes.height * 0.005,
            ),
            Text(
              "Please see the alerts for verifying your profile and start receiving the jobs",
              style: TextStyle(
                  color: AppColors.clr_white,
                  fontSize: 10,
                  fontFamily: 'MuliRegular',
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget getBottomButton({@required String name, Function onButtonClick}){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        disabledColor: AppColors.clr_bg_black,
        color: AppColors.clr_bg_black,
        splashColor: AppColors.clr_red.withOpacity(0.4),
        focusColor: AppColors.clr_red.withOpacity(0.2),
        onPressed: onButtonClick,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 18,
          ),
          child: Text(
            "$name",
            style: TextStyle(
              color: AppColors.clr_white,
              fontSize: 16,
              fontFamily: 'MuliRegular',
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),
        context: context,
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              height: 2000,
              child: ListView(
                children: [
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      Container(
                        width: 260,
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                        child: Text(
                          'We will send a link on your email to reset your password',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 10, 35, 0),
//                  padding: EdgeInsets.only(left: 10,),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.grey,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      // FutureBuilder(
                      //   future: _loginProvider.getForgotPassword(context: context, email: forgotEmail.text),
                      //   builder: ((context, AsyncSnapshot<bool> snapshot){
                      //     if(snapshot.hasData){
                      //       //data is loaded
                      //       return
                      //     }
                      //     else{
                      //       //data not loaded yet
                      //       return Container(child: Text("Loading..."),);
                      //     }
                      //   }),
                      //
                      // ),
                      Container(
                          width: AppSizes.width * 0.4,

                          child: FlatButton(
                            onPressed: () {

                            },
                            child: Text(
                              'Send Email',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
