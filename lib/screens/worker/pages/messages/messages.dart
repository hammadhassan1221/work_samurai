import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';
import 'package:work_samurai/screens/support/support.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts.dart';
import 'package:work_samurai/screens/worker/pages/messages/messages_components.dart';
import 'package:work_samurai/screens/worker/pages/messages/messages_provider.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/archive/archive.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/completed/completed.dart';
import 'package:work_samurai/widgets/widgets.dart';

import '../../worker_provider.dart';

class WorkerChatRoom extends StatefulWidget {
  @override
  _WorkerChatRoomState createState() => _WorkerChatRoomState();
}

class _WorkerChatRoomState extends State<WorkerChatRoom>with TickerProviderStateMixin {
  TabController _tabController;
  WorkerProvider _workerProvider;
  MessageComponents _messageComponents;

  final List<Widget> children = [
    Completed(),
    Archive(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageComponents= MessageComponents();
    _workerProvider = Provider.of<WorkerProvider>(context,listen:false);
    _tabController = new TabController(length: 2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    Provider.of<MessageProviders>(context, listen: true);
    return Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CommonWidgets.getGigsAppBar(text: "Messages"),

          Container(
            decoration: BoxDecoration(
              color: AppColors.clr_white,
            ),
            width: AppSizes.width,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.clr_white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 0.7,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: AppSizes.width * 0.01),
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontFamily: 'MuliSemiBold'),
                indicatorColor: AppColors.clr_bg_grey,
                labelColor: AppColors.clr_bg_black,
                unselectedLabelColor: AppColors.clr_bg_black3,
                indicator: BoxDecoration(
                    color: AppColors.clr_white,
                    border: Border(
                        bottom: BorderSide(
                          color: AppColors.clr_bg_black,
                          width: 3.0,
                        ))),
                isScrollable: true,
                tabs: <Widget>[
                  _tabBar("Active"),
                  _tabBar("Archive"),
                ],
              ),
            ),
          ),

          CommonWidgets.getAlertContainer(onPress: (){
            _workerProvider.setCurrentIndex(4);
          }),


          SizedBox(
            height: AppSizes.height * 0.02,
          ),

          CommonWidgets.getSupportContainer(imagePath: Assets.support, heading: "Work Samurai Support", onPress: (){Navigator.push(context, SlideRightRoute(page:Support()));}),

          SizedBox(
            height: AppSizes.height * 0.025,
          ),
          Container(
            child: Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _messageComponents.getMessageThread(onPress: (){Navigator.push(context,SlideRightRoute(page: ChatScreen()));}, imagePath: Assets.support, heading: "Crown Hotel New York", subHeading: "Waiter Wed,Sep 23", imagePath1: Assets.star, rating: "4.5"),
                  Container(color:AppColors.clr_red),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  _tabBar(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}

