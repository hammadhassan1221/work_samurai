import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/settings/settings.dart';
import 'package:work_samurai/screens/worker/pages/account/account_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

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
        body:  Container(
          padding: EdgeInsets.only(right: 25, left: 25,),
                color: AppColors.clr_bg,
                //margin: EdgeInsets.all(AppSizes.width * 0.03),
                child: _accountProviders.getIsDataFetched()
                    ? ListView(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: _accountComponent.getUserEdit(
                          imagePath: _accountProviders.getUserWholeData().data.user.document == null ? "https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png" :_accountProviders.getUserWholeData().data.user.document["URL"],
                          imagePath1: _accountProviders.getUserWholeData().data.user.document == null ? "https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png" :_accountProviders.getUserWholeData().data.user.document["URL"],
                          text: "Account",
                          onPress: () {
                            Navigator.push(
                                context, SlideRightRoute(page: Settings()));
                          }),
                    ),
                    //  imagePath: Assets.support, text: "Settings",onPress:(){}),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                    _accountComponent.getUserRatingCity(
                      name:
                          '${_accountProviders.getUserWholeData().data.user.firstname} ${_accountProviders.getUserWholeData().data.user.lastname}',
                      rating:  _accountProviders.getUserWholeData().data.userRating,
                      city:
                          _accountProviders.getUserWholeData().data.userAddress.city,
                    ),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),
                    _accountComponent.getUserDetails(
                      text:
                          _accountProviders.getUserWholeData().data.userAddress.addressLine,
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
                    _accountProviders.getUserWholeData().data.userVerifications.length > 0?
                    Wrap(
                      children: [
                        ...List.generate(
                          _accountProviders.getUserWholeData().data.userVerifications.length,
                              (index) => _accountComponent.getDocumentDetails(
                              text: "Work rights verified"),
                        ),
                      ],
                    )
                        :CommonWidgets.onNullData(text: "No User Verifications"),
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
                        child: Text(
                            '${_accountProviders.getUserWholeData().data.completedJobs.toString()}',
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
                    _accountComponent.getHeadings(text: "Compliments"),
                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),

                    SizedBox(
                      height: AppSizes.height * 0.01,
                    ),

                    _accountProviders.getUserWholeData().data.userCompliments.length > 0?
                    Wrap(
                      children: [
                        ...List.generate(
                            _accountProviders.getUserWholeData().data.userCompliments.length,
                                (index) => _accountComponent.getCompliments(
                              imagePath: Assets.diamond,
                              compliment: _accountProviders.getUserWholeData().data.userCompliments[index].name,
                              rating: _accountProviders.getUserWholeData().data.userCompliments[index].count.toString(),
                            )
                        )
                      ],
                    )
                    :CommonWidgets.onNullData(text: "No Compliments"),

                  ],
                ) : Container(
                  height: AppSizes.height*0.785,
                 // color: AppColors.clr_bg_grey.withOpacity(0.4),
                  child: Center(
                    child: Container(
                      height: AppSizes.height * 0.20,
                      width: AppSizes.width * 0.30,
                      child: Lottie.asset(Assets.loader),
                    ),
                  ),
                ),
              )
      ),
    );
  }
}
