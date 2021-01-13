import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/support/support_components.dart';
import 'package:work_samurai/screens/support/support_messages.dart';
import 'package:work_samurai/screens/support/support_providers.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {

  SupportComponents _supportComponents;
  SupportProviders _supportProviders;
  TextEditingController _supportTitle;
  UserWholeData _userWholeData;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();
  TextEditingController desc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _supportComponents = SupportComponents();
    _supportProviders = Provider.of<SupportProviders>(context, listen:false);

    Future.delayed(Duration.zero, () async {
      await  _supportProviders.init(context: context,);
    });
    String userDataFromPrefs = PreferenceUtils.getString(Strings.USER_DATA);
    if (userDataFromPrefs.isNotEmpty) {
      _userWholeData = UserWholeData.fromJson(
          _genericDecodeEncode.decodeJson(userDataFromPrefs));
    }
    _supportTitle = TextEditingController();
    desc = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SupportProviders>(context, listen:true);
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.clr_bg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidgets.getAppBar(text: "Support", context: context),
                SizedBox(height: AppSizes.height*0.025,),

                _supportProviders.isDataFetched == true  ? Expanded(

                  child: ListView.builder(
                      itemCount: _supportProviders.supportTicketsModel.data.supportTickets.length,
                      itemBuilder: (context, index){
                        return
                          Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, SlideRightRoute(page: SupportMessages(ticketId: _supportProviders.supportTicketsModel.data.supportTickets[index].iD)));
                                },
                                child: Container(
                                  child:
                                  _supportComponents.getSupportContainer(
                                    imagePath: Assets.support,
                                    heading: "Pending",
                                    title: _supportProviders.supportTicketsModel.data.supportTickets[index].title,),
                                ),
                              ),
                              SizedBox(height: AppSizes.height * 0.025),
                            ],
                          );
                      }
                  ),
                ): Align(
                  alignment: Alignment.center,
                  child: Expanded(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Lottie.asset(Assets.loader),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 5),
                  child: CommonWidgets.getSignUpButton(
                      context: context, onPress: () {
                    // jobRolesProviders.result = null;
                    _onButtonPressed();
                  }, text: "Add Ticket"),
                ),
                SizedBox(
                  height: AppSizes.height * 0.025,
                )

              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //     elevation: 0.0,
          //     child:  Icon(Icons.add),
          //     backgroundColor:  AppColors.clr_bg_black,
          //     onPressed: (){
          //       _supportProviders.callSupportTicket(context: context, supportTicket: "New Ticket",
          //       );
          //     }
          // )

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
            resizeToAvoidBottomInset: false,
            body: StatefulBuilder(
                builder: (BuildContext context ,StateSetter mystate){
                  return Container(
                    height: 1000,
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
                              Column(
                                children: [

                                ],
                              ),


                              //  jobRolesProviders.result != null ? _pickerWidget("file attached") : _pickerWidget1("No file attached , please pick files"),
                              SizedBox(height: 10,),
                              CommonWidgets.getInputField1(
                                backgroundColor: AppColors.transparentColor,
                                borderColor: AppColors.clr_bg_grey,
                                textColor: AppColors.clr_bg_black2,
                                text: "Ticket Title",
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
                                      if(desc.text.isNotEmpty ){
                                        await _supportProviders.supportTicket(context: context, supportTicket: desc.text);
                                        desc.clear();

                                        Navigator.pop(context);

                                      }else{
                                        // email.clear();
                                        // password.clear();
                                        // forgotEmail.clear();
                                        ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Please Provide Title");
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
}
