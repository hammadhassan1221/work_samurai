import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/add_document/add_document_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class AddDocument extends StatefulWidget {
  @override
  _AddDocumentState createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  AddDocumentComponents _addDocumentComponents;
  String _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addDocumentComponents = AddDocumentComponents();

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
                Expanded(child: ListView(children: [
                  _addDocumentComponents.getHeadings(text: "Add a Document Verification"),
                  //_addDocumentComponents.getUserInfo(onPress: (){}, text: "Verification Type", text1: "VEVO Check", iconData: Icons.keyboard_arrow_down, colors: AppColors.clr_bg_black),
                  Container(
                    padding: EdgeInsets.only(
                      left: AppSizes.width * 0.03,
                      right: AppSizes.width * 0.03,
                    ),
                    height: AppSizes.height * 0.07,
                    width: AppSizes.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.sign_field),
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(
                      left: AppSizes.width * 0.03,
                      right: AppSizes.width * 0.03,
                      top: AppSizes.width * 0.03,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Container(),
                      value: _selectedValue,
                      hint: Text("Verification Type"),
                      items: <String>['VEVO Check', 'Police Lodgement', 'Driver Licence', 'Tesla', 'Criminal Background Check']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                    ),
                  ),
                  _addDocumentComponents.getDescriptionContainer(heading: "Description", desc: ""),
                  SizedBox(height:AppSizes.height*0.025),
                  _addDocumentComponents.getDottedContainer(),
                ],)),
                CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Save"),

                SizedBox(height:AppSizes.height*0.025)
              ],
            ),
          ),
        ));
  }
}