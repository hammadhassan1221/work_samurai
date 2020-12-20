import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts.dart';
import 'package:work_samurai/screens/worker/pages/messages/messages_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

import '../../worker_provider.dart';

class WorkerChatRoom extends StatefulWidget {
  @override
  _WorkerChatRoomState createState() => _WorkerChatRoomState();
}

class _WorkerChatRoomState extends State<WorkerChatRoom> {

  WorkerProvider _workerProvider;
  MessageComponents _messageComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageComponents= MessageComponents();
    _workerProvider = Provider.of<WorkerProvider>(context,listen:false);

  }
  @override
  Widget build(BuildContext context) {
    Provider.of<WorkerProvider>(context, listen: true);

    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CommonWidgets.getAppBarWithout(text: "Messages",),

            CommonWidgets.getAlertContainer(onPress: (){_workerProvider.setCurrentIndex(4);}),

            SizedBox(
              height: AppSizes.height * 0.02,
            ),

            CommonWidgets.getSupportContainer(imagePath: Assets.support,heading: "Work Samurai Support",onPress: (){}),

            SizedBox(
              height: AppSizes.height * 0.02,
            ),

            _messageComponents.getMessageThread(onPress: (){Navigator.push(context, SlideRightRoute(page:ChatScreen()));}, imagePath: Assets.oval, heading: "Crown Hotel", subHeading: "Waiter, Wed, Sep 23" , imagePath1: Assets.star, rating: "4.5"),



          ]),
    );
  }
}

