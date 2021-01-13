import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/settings/settings.dart';
import 'package:work_samurai/screens/worker/pages/account/account_provider.dart';

import 'account_components.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AccountComponent _accountComponent;
  AccountProviders _accountProviders;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accountComponent = AccountComponent();
    _accountProviders = Provider.of<AccountProviders>(context, listen: false);
    _accountProviders.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    _accountProviders = Provider.of<AccountProviders>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Container(
          color: AppColors.clr_bg,
          margin: EdgeInsets.all(AppSizes.width*0.03),
          child: ListView(
            children: [

              Align(
                alignment: Alignment.topRight,
                child: _accountComponent.getUserEdit(
                      imagePath: Assets.support,imagePath1: Assets.user, text: "Account",onPress:(){Navigator.push(context, SlideRightRoute(page: Settings()));}),
              ),
                //  imagePath: Assets.support, text: "Settings",onPress:(){}),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              _accountComponent.getUserRatingCity(
                  name: "Robert Miller", rating: "4.5", city: "New York"),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              _accountComponent.getUserDetails(
                text:
                    "Fusce maximus cursus lectus, varius ultricies erat molestie vel. Fusce sapien urna, rhoncus et tempor vel, placerat eu velit. Pellentesque nec felis pulvinar, luctus lectus eget!",
              ),
              SizedBox(
                height: AppSizes.height * 0.015,
              ),
              Container(
                height: AppSizes.height * 0.0025,
                decoration: BoxDecoration(
                    color: AppColors.clr_field,
                    borderRadius: BorderRadius.circular(3)),
              ),
              SizedBox(
                height: AppSizes.height * 0.015,
              ),
              _accountComponent.getDocumentDetails(
                  text: "Work rights verified"),
              _accountComponent.getDocumentDetails(
                text: "Driver License verified",
              ),
              _accountComponent.getDocumentDetails(text: "Police check"),
              SizedBox(
                height: AppSizes.height * 0.015,
              ),
              Container(
                height: AppSizes.height * 0.0025,
                decoration: BoxDecoration(
                    color: AppColors.clr_field,
                    borderRadius: BorderRadius.circular(3)),
              ),

              _accountComponent.getHeadings(text: "Completed Jobs"),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              Container(
                  child: Text("4",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'MuliSemiBold',
                        color: AppColors.clr_bg_black,
                      ))),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              Container(
                height: AppSizes.height * 0.0025,
                decoration: BoxDecoration(
                    color: AppColors.clr_field,
                    borderRadius: BorderRadius.circular(3)),
              ),
              _accountComponent.getHeadings(text: "Positions"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _accountComponent.getPositionContainer(
                  text1: "Waiter",
                  text2: "Bartender",
                  text3: "Barista",
                  text4: "Receptionist",),
              SizedBox(
                height: AppSizes.height * 0.03,
              ),
              Container(
                height: AppSizes.height * 0.0025,
                decoration: BoxDecoration(
                    color: AppColors.clr_field,
                    borderRadius: BorderRadius.circular(3)),
              ),
              _accountComponent.getHeadings(text: "Compliments"),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              _accountComponent.getCompliments(
                  imagePath: Assets.diamond,
                  compliment: "Perfect Service",
                  rating: "3"),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              _accountComponent.getCompliments(
                  imagePath: Assets.communicate,
                  compliment: "Good Communication",
                  rating: "10"),
              SizedBox(
                height: AppSizes.height * 0.01,
              ),
              _accountComponent.getCompliments(
                  imagePath: Assets.muscle,
                  compliment: "Hard Worker",
                  rating: "6"),
              SizedBox(
                height: AppSizes.height * 0.03,
              ),
            ],
          )),
    ));
  }
}
