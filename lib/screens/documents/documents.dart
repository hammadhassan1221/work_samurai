import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/add_document/add_document.dart';
import 'package:work_samurai/screens/background_check/background_check.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'documents_components.dart';

class DocumentVerification extends StatefulWidget {
  @override
  _DocumentVerificationState createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  DocumentComponents _documentComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _documentComponents =  DocumentComponents();
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
                children:[
                  CommonWidgets.getAppBar(text: "Document Verification", context: context),
                 Expanded(
                   child: ListView(
                     children: [
                       _documentComponents.getHeadings(text: "Worker Requirements"),
                       SizedBox(height:AppSizes.height*0.015),
                       _documentComponents.getUserInfo2(onPress: () async{
                         /*Navigator.push(context, SlideRightRoute(page: BackgroundCheck()));*/
                         const url = 'https://www.google.com';
                         if (await canLaunch(url)) {
                         await launch(url);
                         }
                       }, text: "Unverified", text1: "Criminal Background Check",),
                       SizedBox(height:AppSizes.height*0.015),

                     //  _documentComponents.getUserInfo2(text: "Your Current Photo id",iconData: Icons.warning,colors: AppColors.clr_red ,onPress: (){}),
                    //    _documentComponents.getUserInfo(text: "Statutory Declaration",text1:"Country Proof of Age",iconData: Icons.warning,colors: AppColors.clr_red ,onPress: (){}),
                   //     _documentComponents.getUserInfo2(text: "Country Proof Of Age",iconData: Icons.check_circle_outline,colors: Colors.lightGreen ,onPress: (){}),
                   //    _documentComponents.getUserInfo(text: "Drivers Licence",text1:"Completed",iconData: Icons.check_circle,colors: AppColors.clr_bg_black ,onPress: (){Navigator.push(context, SlideRightRoute(page:UpdateDocuments()));}),
                       _documentComponents.getUserInfo(text: "Drivers Licence",text1:"Completed",iconData: Icons.check_circle,colors: AppColors.clr_bg_black ,onPress: (){}),
                       SizedBox(height:AppSizes.height*0.015),

                       _documentComponents.getUserInfo(text: "Proof Of Age",text1:"Completed",iconData: Icons.check_circle,colors: AppColors.clr_bg_black ,onPress: (){}),
                       SizedBox(height:AppSizes.height*0.015),
                       _documentComponents.getUserInfo2(onPress: (){}, text: "Unverified", text1: "VEVO Check", ),
                     ],
                   ),
                 ),
                  CommonWidgets.getBottomButton(name: "Add Document", onButtonClick: (){
                    Navigator.push(context, SlideRightRoute(page: AddDocument()));
                  }),
                  SizedBox(height:AppSizes.height*0.015),
                ]),
          ),
        ));
  }
}