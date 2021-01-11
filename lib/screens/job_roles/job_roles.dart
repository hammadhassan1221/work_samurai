import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/job_roles/job_roles_providers.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'job_roles_components.dart';



class JobRole extends StatefulWidget {
  @override
  _JobRoleState createState() => _JobRoleState();
}
String _selectedSkillId;
class _JobRoleState extends State<JobRole> {
  JobRolesComponents _jobRolesComponents;
  JobRolesProviders jobRolesProviders;
  TextEditingController desc;
  int _value = null;
  int usertypeId;
  String _selectedValue;
  bool fileAttached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobRolesComponents = JobRolesComponents();
    desc = TextEditingController();
    jobRolesProviders = Provider.of<JobRolesProviders>(context, listen: false);
    Future.delayed(Duration.zero, () async {
       await jobRolesProviders.init(context);
       jobRolesProviders.result = null;
    });
    _value = null;
    usertypeId = 0;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<JobRolesProviders>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.clr_bg,
            child: jobRolesProviders.isDataFetched == true ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.getAppBar(text: "Job Roles", context: context),
                // _jobRolesComponents.getHeading(text: "Worker Job Role"),
                Container(
                  height: AppSizes.height*0.76
                  ,
                  child: ListView.builder(
                      itemCount: jobRolesProviders.getUserSkilllsResponse.data.userSkills.length,
                      itemBuilder: (context, index){
                        return
                          Column(
                            children: [
                              SizedBox(height: 20,),
                              _jobRolesComponents.getJobRolesContainer(
                                  backgroundColor: AppColors.clr_white,
                                  borderColor: AppColors.transparentColor,
                                  textColor: AppColors.clr_bg_black,
                                  job:  jobRolesProviders.getUserSkilllsResponse.data.userSkills[index].skill.name,
                                  verify: "verified"),
                              SizedBox(height: AppSizes.height * 0.025),
                            ],
                          );


                      }
                  ),
                ),

                //  SizedBox(
                //    height: AppSizes.height * 0.025,
                //  ),
                // _jobRolesComponents.getVerifiedJobRolesContainer(
                //     backgroundColor: AppColors.clr_white,
                //     borderColor: AppColors.transparentColor,
                //     textColor: AppColors.clr_bg_black,
                //     job: "Waiter",
                //     verify: "Verified"),
                // SizedBox(
                //   height: AppSizes.height * 0.025,
                // ),
                // _jobRolesComponents.getVerifiedJobRolesContainer(
                //     backgroundColor: AppColors.clr_white,
                //     borderColor: AppColors.transparentColor,
                //     textColor: AppColors.clr_bg_black,
                //     job: "Chef",
                //     verify: "Verified"),
                // Expanded(
                //   child: CommonWidgets.getSignUpButton(
                //       context: context, onPress: () {
                //     jobRolesProviders.result = null;
                //     _onButtonPressed();
                //   }, text: "Add a Role"),
                // ),

                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 0),
                  child: CommonWidgets.getSignUpButton(
                      context: context, onPress: () {
                    // jobRolesProviders.result = null;
                    _onButtonPressed();
                  }, text: "Add Job Roles "),
                ),

              ],
            ): Container(

            ),

          ),
        )
    );
  }
  void _onButtonPressed() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
        ),
        context: context,
        builder: (context) {
          return Scaffold(
            //physics: ClampingScrollPhysics(),
            resizeToAvoidBottomInset: true,
            body: StatefulBuilder(
                builder: (BuildContext context ,StateSetter mystate){
                  return Container(
                    height: 2000,
                    child: ListView(
                        children: [
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 15 , left: 25),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            Assets.sheetClose,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  // Container(
                                  //   width: AppSizes.width*0.85,
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     boxShadow: [
                                  //       BoxShadow(
                                  //         color: Colors.grey.withOpacity(0.5),
                                  //         spreadRadius: 2,
                                  //         blurRadius: 4,
                                  //         offset: Offset(0, 2), // changes position of shadow
                                  //       ),
                                  //     ],
                                  //     border: Border(
                                  //
                                  //       bottom: BorderSide(
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   child: DropdownButton(
                                  //     isExpanded: true,
                                  //     itemHeight: 50,
                                  //     iconSize: 35,
                                  //     elevation: 100,
                                  //     iconEnabledColor: Colors.black,
                                  //     dropdownColor: Colors.white,
                                  //     hint: Text(
                                  //       "Select Role",
                                  //       style: TextStyle(
                                  //         color: Colors.black,
                                  //       ),
                                  //     ),
                                  //     value: _value,
                                  //     underline: Container(),
                                  //     style: TextStyle(
                                  //       color: Colors.black,
                                  //     ),
                                  //     items: [
                                  //       DropdownMenuItem(
                                  //         child: Text(
                                  //           "Customer",
                                  //         ),
                                  //         value: 1,
                                  //         onTap: (){
                                  //           mystate(() {
                                  //             usertypeId = int.parse("3");
                                  //           });
                                  //         },
                                  //       ),
                                  //       DropdownMenuItem(
                                  //         child: Text(
                                  //           "Trainer",
                                  //         ),
                                  //         value: 2,
                                  //         onTap: (){
                                  //           mystate(() {
                                  //             usertypeId = int.parse("2");
                                  //           });
                                  //         },
                                  //       ),
                                  //     ],
                                  //     onChanged: (value) {
                                  //       mystate(() {
                                  //         _value = value;
                                  //       });
                                  //     },
                                  //   ),
                                  // ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: AppSizes.width * 0.07,
                                      right: AppSizes.width * 0.07,
                                    ),
                                    height: AppSizes.height * 0.07,
                                    width: AppSizes.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.clr_bg_black),
                                        borderRadius: BorderRadius.circular(8)),
                                    margin: EdgeInsets.only(
                                      left: AppSizes.width * 0.07,
                                      right: AppSizes.width * 0.07,
                                      top: AppSizes.width * 0.03,
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: _selectedValue,
                                        hint: Text("Select job skill"),
                                        items: jobRolesProviders.skills
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                        onChanged: (String value) {
                                          mystate(() {
                                            _selectedValue = value;
                                            _selectedSkillId = jobRolesProviders.skillIDs[
                                            jobRolesProviders.skills.indexOf(value)];
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: () async{
                                  await jobRolesProviders.pickFile();
                                  mystate((){

                                  });
                                },
                                child: DottedBorder(
                                  color: Colors.grey,

                                  strokeWidth: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: AppSizes.height*0.06,
                                    width: AppSizes.width*0.85,
                                    child: Text(
                                      '+  Attach FIle',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),

                              jobRolesProviders.result != null ? _pickerWidget("file attached") : _pickerWidget1("No file attached , please pick files"),
                              SizedBox(height: 15,),
                              // Container(
                              //   padding: EdgeInsets.only(
                              //     left: AppSizes.width * 0.07,
                              //     right: AppSizes.width * 0.07,
                              //   ),
                              //   height: AppSizes.height * 0.07,
                              //   width: AppSizes.width,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(color: AppColors.clr_bg_black),
                              //       borderRadius: BorderRadius.circular(8)),
                              //   margin: EdgeInsets.only(
                              //     left: AppSizes.width * 0.07,
                              //     right: AppSizes.width * 0.07,
                              //     top: AppSizes.width * 0.03,
                              //   ),
                              //   child: TextField(
                              //     maxLines: 3,
                              //   )
                              // ),
                              CommonWidgets.getInputField1(
                                backgroundColor: AppColors.transparentColor,
                                borderColor: AppColors.clr_bg_grey,
                                textColor: AppColors.clr_bg_black2,
                                text: "Description",
                                controller: desc,
                                isPassword: false,
                                imagePath: Assets.edit,
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  width: AppSizes.width * 0.7,
                                  color: AppColors.clr_bg_black,
                                  child: FlatButton(
                                    onPressed: () async {
                                      if(desc.text.isNotEmpty && jobRolesProviders.result != null && _selectedSkillId.isNotEmpty ){
                                        await jobRolesProviders.addUserSkill(context: context, desc: desc.text, userSkillId: _selectedSkillId);
                                         desc.clear();

                                       Navigator.pop(context);

                                      }else{
                                        // email.clear();
                                        // password.clear();
                                        // forgotEmail.clear();
                                        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Please Provide all fields ");
                                      }
                                    },
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MuliRegular',
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ]

                    ),
                  );
                }
            ),
          );
        });
  }
  Widget _pickerWidget(String text){

    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.done,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 15,),
            Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(

                ),
              ),
            ),
          ],
        )
    );
  }
  Widget _pickerWidget1(String text){

    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 15,),
            Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(

                ),
              ),
            ),
          ],
        )
    );
  }
}
