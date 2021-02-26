import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/support/support_messages_provider.dart';
import 'package:work_samurai/widgets/toast.dart';

import 'package:work_samurai/widgets/widgets.dart';

class SupportMessages extends StatefulWidget {
  int ticketId;

  SupportMessages({@required int this.ticketId});

  @override
  _SupportMessagesState createState() => _SupportMessagesState();

}


class _SupportMessagesState extends State<SupportMessages>{
  var _controller = ScrollController();
  SupportMessagesProvider _supportMessagesProvider;
  TextEditingController msgBody;
  @override
  void initState() {
    super.initState();
    msgBody = TextEditingController();
    _supportMessagesProvider = Provider.of<SupportMessagesProvider>(context, listen:false);
    _supportMessagesProvider.init (context, widget.ticketId);

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

  @override
  Widget build(BuildContext context) {
    Provider.of<SupportMessagesProvider>(context, listen:true);
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToEnd());

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            //resizeToAvoidBottomPadding: true,
            body: Container(
              color: AppColors.clr_white,
              height: AppSizes.height,
              width: AppSizes.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.getAppBar(
                      text: "Chat with Support", context: context),
                  _supportMessagesProvider.isDataFetched == true ? Expanded(
                    child:  _supportMessagesProvider.getSupportMessage.data != null ? ListView.builder(
                      controller: _controller,
                        itemCount: _supportMessagesProvider.getSupportMessage.data.length,
                        itemBuilder: (context, index) {
                        if(_supportMessagesProvider.getSupportMessage.data.elementAt(index).systemAdminID == null){
                          ///Message is mine
                          return Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(12),
                                      padding: EdgeInsets.all(10),
                                      width: AppSizes.width * 0.60,

                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.25),
                                              spreadRadius: 0.5,
                                              blurRadius: 1,
                                              offset: Offset(0, 1), // changes position of shadow
                                            ),
                                          ],
                                          color: AppColors.clr_bg_black2,
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Text(
                                        _supportMessagesProvider.getSupportMessage.data[index].body,
                                        style: TextStyle(
                                          color: Colors.white,
                                            letterSpacing: 0.15,
                                            fontSize: 15,
                                            fontFamily: 'MuliRegular'),
                                      ),
                                    ),
                                  ]),
                            ],
                          );
                        }
                        else{
                          ///Message is other's
                          return Column(
                            children: [
                              Row(
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
                                        _supportMessagesProvider.getSupportMessage.data[index].body,
                                        style: TextStyle(
                                            letterSpacing: 0.15,
                                            fontSize: 15,
                                            fontFamily: 'MuliRegular'),
                                      ),
                                    ),
                                  ]),
                            ],
                          );
                        }

                        }
                    ) : Container(
                      height: 30,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'No messages available',
                        style: TextStyle(
                          fontFamily: 'MuliRegular',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ) : Expanded(
                    child: Container (
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
                        //  Icon(Icons.attach_file),
                          SizedBox(
                            width: AppSizes.width * 0.01,
                          ),
                          GestureDetector(
                              onTap: () async {
                                if(msgBody.text.isNotEmpty) {
                                  await _supportMessagesProvider.sendSupportMessages(context: context, body: msgBody.text, ticketId: widget.ticketId);
                                msgBody.clear();
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  _supportMessagesProvider.getSupportMessages(context: context, ticketId: widget.ticketId);
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
      margin: EdgeInsets.only(left:10, top: 10, bottom: 10),
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
