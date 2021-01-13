import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/update_documents/update_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class UpdateDocuments extends StatefulWidget {
  @override
  _UpdateDocumentsState createState() => _UpdateDocumentsState();
}

class _UpdateDocumentsState extends State<UpdateDocuments> {
  UpdateComponents _updateComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateComponents =  UpdateComponents();
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
              children: [
                CommonWidgets.getAppBar(text: "Document Verification", context: context),
                _updateComponents.getHeadings(text: "Add Your Documentation"),
                SizedBox(height: AppSizes.height*0.025,),

                _updateComponents.getSubHeadings(),

                SizedBox(height: AppSizes.height*0.1,),
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage(Assets.files),
                    fit: BoxFit.cover,
                    height: 160,
                    width: 160,
                  ),
                ),
                Expanded(child: CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Choose File"))

              ],
            ),
          ),
        )
    );
  }
}

