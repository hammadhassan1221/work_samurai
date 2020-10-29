import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/document_verification/document_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

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
            child: Stack(
                children:[
                  Column(
                    children: [
                      _documentComponents.getAppBar(text: "Document Verification", context: context),

                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(child: Text("Pending Because of Discussion")),
                  ),
                  Positioned(
                    bottom: 0,
                    child: CommonWidgets.getButton(backgroundColor: AppColors.clr_bg_black, borderColor: AppColors.transparentColor, textColor: AppColors.clr_white, text: "Update", onPress: (){}),
                  )
                ]),
          ),
        ));
  }
}
