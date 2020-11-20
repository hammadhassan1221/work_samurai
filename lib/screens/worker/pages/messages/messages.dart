import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';
import 'package:work_samurai/screens/worker/pages/messages/messages_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class WorkerChatRoom extends StatefulWidget {
  @override
  _WorkerChatRoomState createState() => _WorkerChatRoomState();
}

class _WorkerChatRoomState extends State<WorkerChatRoom> {

  MessageComponents _messageComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageComponents= MessageComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_field,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CommonWidgets.getAppBarWithout(text: "Messages",),

              SizedBox(
                height: AppSizes.height * 0.02,
              ),

              CommonWidgets.getSupportContainer(imagePath: Assets.support,heading: "Work Samurai Support",onPress: (){}),

              SizedBox(
                height: AppSizes.height * 0.02,
              ),

              _messageComponents.getMessageThread(onPress: (){Navigator.push(context, SlideRightRoute(page:ChatScreen()));}, imagePath: Assets.support, heading: "Bartender", subHeading: "Wed, Sep 23 ,11:00am - 1:00pm", imagePath1: Assets.star, rating: "4.5"),

              SizedBox(height: AppSizes.height*0.02,),

              _messageComponents.getMessageThread(onPress: (){Navigator.push(context, SlideRightRoute(page:ChatScreen()));}, imagePath: Assets.support, heading: "Bartender", subHeading: "Wed, Sep 23 ,11:00am - 1:00pm", imagePath1: Assets.star, rating: "4.5"),

            ]),
      ),
    );
  }
}

