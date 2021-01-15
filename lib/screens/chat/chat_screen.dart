import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/chat/chat_providers.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  final int jobId;
  final String appBarName;

  ChatScreen({@required this.jobId , @required this.appBarName});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _controller = ScrollController();
  ChatProviders _chatProviders ;
  TextEditingController msgBody;
  @override

  void initState() {
    super.initState();
    msgBody = TextEditingController();
    _chatProviders = Provider.of<ChatProviders>(context, listen:false);

    _chatProviders.init (context, widget.jobId);

  }
  void scrollToEnd(){
    try {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
   Provider.of<ChatProviders>(context, listen:true);
   WidgetsBinding.instance.addPostFrameCallback((_) => scrollToEnd());
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            //resizeToAvoidBottomPadding: true,
            body:  Container(
              color: AppColors.clr_white,
              height: AppSizes.height,
              width: AppSizes.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.getAppBar(
                      text: widget.appBarName, context: context),
                  Container(
                    height: AppSizes.height * 0.125,
                    padding: EdgeInsets.all(AppSizes.width * 0.03),
                    margin: EdgeInsets.only(
                        left: AppSizes.width * 0.03,
                        right: AppSizes.width * 0.03,
                        top: AppSizes.height * 0.03),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.clr_bg_grey),
                        color: AppColors.clr_bg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(Assets.support),
                        SizedBox(
                          width: AppSizes.width * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Waiter",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'MuliBold',
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.01,
                            ),
                            Text("Wed, Sep 23 11:00am - 1:00pm",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.clr_bg_black2,
                                  fontFamily: 'MuliRegular',
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  _chatProviders.isDataFetched == true ? Expanded(
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: _chatProviders.getAllMessagesofUserJobModel.data.messages.length,
                       itemBuilder: (context, index){
                         if(_chatProviders.getAllMessagesofUserJobModel.data.messages.elementAt(index).userID == PreferenceUtils.getInt(Strings.USER_ID)){
                           return  Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Container(
                                   margin: EdgeInsets.all(12),
                                   padding: EdgeInsets.all(10),
                                   width: AppSizes.width * 0.60,

                                   decoration: BoxDecoration(
                                       boxShadow: [
                                         BoxShadow(
                                           color: Colors.grey.withOpacity(0.25),
                                           spreadRadius: 0.5,
                                           blurRadius: 1,
                                           offset: Offset(0, 1), // changes position of shadow
                                         ),
                                       ],
                                       color: AppColors.clr_bg_black2,
                                       borderRadius: BorderRadius.circular(8)),
                                   child: Text(
                                     _chatProviders.getAllMessagesofUserJobModel.data.messages[index].body,
                                     style: TextStyle(
                                         color: Colors.white,
                                         letterSpacing: 0.15,
                                         fontSize: 15,
                                         fontFamily: 'MuliRegular'),
                                   ),
                                 ),
                               ]
                           );
                         }
                         else{
                           return  Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Container(
                                   margin: EdgeInsets.all(12),
                                   padding: EdgeInsets.all(10),
                                   width: AppSizes.width * 0.60,

                                   decoration: BoxDecoration(
                                       boxShadow: [
                                         BoxShadow(
                                           color: Colors.grey.withOpacity(0.25),
                                           spreadRadius: 0.5,
                                           blurRadius: 1,
                                           offset: Offset(0, 1), // changes position of shadow
                                         ),
                                       ],
                                       color: AppColors.clr_bg,
                                       borderRadius: BorderRadius.circular(8)),
                                   child: Text(
                                     _chatProviders.getAllMessagesofUserJobModel.data.messages[index].body,
                                     style: TextStyle(
                                         letterSpacing: 0.15,
                                         fontSize: 15,
                                         fontFamily: 'MuliRegular'),
                                   ),
                                 ),
                               ]
                           );
                         }
                        return  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(12),
                                padding: EdgeInsets.all(10),
                                width: AppSizes.width * 0.60,

                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        spreadRadius: 0.5,
                                        blurRadius: 1,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: AppColors.clr_bg,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                _chatProviders.getAllMessagesofUserJobModel.data.messages[index].body,
                                  style: TextStyle(
                                      letterSpacing: 0.15,
                                      fontSize: 15,
                                      fontFamily: 'MuliRegular'),
                                ),
                              ),
                            ]
                        );
                       }

                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Container(
                        //         margin: EdgeInsets.all(12),
                        //         padding: EdgeInsets.all(10),
                        //         width: AppSizes.width * 0.25,
                        //         decoration: BoxDecoration(
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 color: Colors.grey.withOpacity(0.25),
                        //                 spreadRadius: 0.5,
                        //                 blurRadius: 1,
                        //                 offset: Offset(0, 1), // changes position of shadow
                        //               ),
                        //             ],
                        //             color: AppColors.clr_bg,
                        //             borderRadius: BorderRadius.circular(8)),
                        //         child: Text(
                        //           "Aliquam!",
                        //           style: TextStyle(
                        //               fontSize: 15,
                        //               letterSpacing: 0.25,
                        //               fontFamily: 'MuliRegular'),
                        //         ),
                        //       ),
                        //     ]),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         margin: EdgeInsets.only(top: 3),
                        //         padding: EdgeInsets.all(10),
                        //         width: AppSizes.width * 0.25,
                        //         decoration: BoxDecoration(
                        //
                        //             color: AppColors.transparentColor,
                        //             borderRadius: BorderRadius.circular(8)),
                        //         child: Text(
                        //           "11:03am",
                        //           style: TextStyle(
                        //               letterSpacing: 0.25,
                        //               fontFamily: 'MuliRegular',
                        //               fontSize: 14),
                        //         ),
                        //       ),
                        //     ]),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Container(
                        //         margin: EdgeInsets.only(
                        //             right: AppSizes.width * 0.04),
                        //         padding: EdgeInsets.all(10),
                        //         width: AppSizes.width * 0.60,
                        //         decoration: BoxDecoration(
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 color: Colors.grey.withOpacity(0.25),
                        //                 spreadRadius: 0.5,
                        //                 blurRadius: 1,
                        //                 offset: Offset(0, 1), // changes position of shadow
                        //               ),
                        //             ],
                        //             color: AppColors.clr_bg_black,
                        //             borderRadius: BorderRadius.circular(8)),
                        //         child: Text(
                        //           "Quisque vulputate sollicitudin dui, nec placerat ante laoreet sit amet.",
                        //           style: TextStyle(
                        //             color: AppColors.clr_white,
                        //             letterSpacing: 0.25,
                        //             fontFamily: 'MuliRegular',
                        //             fontSize: 14,
                        //           ),
                        //         ),
                        //       ),
                        //     ]),,
                    ),
                  ) : Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(Assets.loader),
                    ),
                  ),
                  Container(

                      color: AppColors.clr_white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _textFieldContainer(),
                          SizedBox(
                            width: AppSizes.width * 0.015,
                          ),
                          //un comment to attach file functionality

                          // Icon(Icons.attach_file),

                          SizedBox(
                            width: AppSizes.width * 0.01,
                          ),
                          GestureDetector(
                              onTap: () async {
                                if(msgBody.text.isNotEmpty) {
                                  await _chatProviders.sendUserJobMessages(context: context, body: msgBody.text, jobId: widget.jobId);
                                  msgBody.clear();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  _chatProviders.getAllUserJobMessages(context: context, jobId: widget.jobId);
                                }
                                else {
                                  ApplicationToast.getWarningToast(durationTime: 2, heading: null, subHeading: "Please type msg first");
                                }
                              },
                              child:
                              Icon(Icons.send)),
                        ],
                      )),
                ],
              ),
            )));
  }

  _textFieldContainer() {
    return Container(
      height: AppSizes.height * 0.075,
      width: AppSizes.width / 1.2,
      margin: EdgeInsets.only(top: 7,bottom: 10, left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1.5,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: AppColors.clr_bg, borderRadius: BorderRadius.circular(6)),
      child: TextField(
        controller: msgBody,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Type your message...",
            hintStyle: TextStyle(fontSize: 14, fontFamily: 'MuliRegular')),
      ),
    );
  }

  _enterButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: AppSizes.height * 0.07,
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.clr_field,
              borderRadius: BorderRadius.circular(6)),
          child: Icon(
            Icons.send,
            color: AppColors.clr_bg_black,
          )),
    );
  }
}
