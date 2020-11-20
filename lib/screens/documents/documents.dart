import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';

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
            color: AppColors.clr_field,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  _documentComponents.getAppBar(text: "Document Verification", context: context),
                 Expanded(
                   child: ListView(
                     children: [
                       _documentComponents.getHeadings(text: "Attached Documents"),
                       _documentComponents.getUserInfo(text: "Your Current Photo id",text1:"",iconData: Icons.warning,colors: AppColors.clr_red ),
                       _documentComponents.getUserInfo(text: "Statutory Declaration",text1:"",iconData: Icons.warning,colors: AppColors.clr_red ),
                       _documentComponents.getUserInfo(text: "Country Proof Of Age",text1:"",iconData: Icons.check_circle_outline,colors: Colors.green ),
                       _documentComponents.getUserInfo(text: "Terms And Conditions",text1:"Completed",iconData: Icons.check_circle_outline,colors: Colors.green ),
                       _documentComponents.getUserInfo(text: "Legal Agreement",text1:"Completed",iconData: Icons.check_circle_outline,colors: Colors.green ),
                       _documentComponents.getUserInfo(text: "Driving Licence",text1:"Completed",iconData: Icons.check_circle_outline,colors: Colors.green ),
                     _documentComponents.getSignUpButton(context: context, onPress: (){}, text: "Update")
                     ],
                   ),
                 ),

                ]),
          ),
        ));
  }
}