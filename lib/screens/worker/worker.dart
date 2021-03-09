import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/account/account.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs.dart';
import 'package:work_samurai/screens/worker/pages/messages/messages.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule.dart';
import 'package:work_samurai/screens/worker/worker_components.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';
import 'package:work_samurai/widgets/toast.dart';

class Worker extends StatefulWidget {
  @override

  _WorkerState createState() => _WorkerState();
}

class _WorkerState extends State<Worker> with TickerProviderStateMixin {
  var pickedTime;
  WorkerProvider workerProvider;
  WorkerComponents workerComponents;
  int currentIndex;

  final List<Widget> pages = [
    Gigs(),
    Schedule(),
    WorkerChatRoom(),
    Account(),
    Alerts(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    workerProvider = Provider.of<WorkerProvider>(context, listen: false);
    workerComponents = WorkerComponents();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      String token = await FirebaseMessaging().getToken();
      print("The token is: :::::: "+ token);
    });
    FirebaseMessaging().configure(
      onMessage: (map) async{
        ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "message received");
      },
      onLaunch: (map) async{
        ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "message received");
      },
      onResume: (map) async{
        ApplicationToast.getSuccessToast(durationTime: 3, heading: null, subHeading: "message received");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<WorkerProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        backgroundColor: AppColors.clr_white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(Assets.gigsActive,
              height: 20,
              width: 20,) ,
            icon: Image.asset(

              Assets.gigsInactive,
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
            title: Text(
              "Gigs",
              style: TextStyle(
                fontSize: 10,
                color: Color.fromRGBO(0, 16, 32, 1),
                fontFamily: Assets.muliRegular,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(Assets.scheduleActive,
              height: 20,
              width: 20,),
            icon: Image.asset(
              Assets.scheduleInactive,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Schedule",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(0, 16, 32, 1),
                fontFamily: Assets.muliRegular,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(Assets.messagesActive,
              height: 20,
              width: 20,),
            icon: Image.asset(
              Assets.messagesInactive,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Messages",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(0, 16, 32, 1),
                fontFamily: Assets.muliRegular,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(Assets.profileInactive,
                height: 20,
              width: 20),
            icon: Image.asset(
              Assets.profileInactive,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(0, 16, 32, 1),
                fontFamily: Assets.muliRegular,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(Assets.alertsActive,
              height: 20,
              width: 20,),
            icon: Image.asset(
              Assets.alertsInactive,
              height: 20,
              width: 20,
            ),
            title: Text(
              "Alerts",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(0, 16, 32, 1),
                fontFamily: Assets.muliRegular,

              ),
            ),
          ),
        ],
      ),
    );
  }

  _currentPage(){
    if(workerProvider.currentIndex == 0){


      return Gigs();
    }if(workerProvider.currentIndex == 1){
      return Schedule();


    }if(workerProvider.currentIndex == 2){
      return WorkerChatRoom();
    }if(workerProvider.currentIndex == 3){
      return Account();
    }if(workerProvider.currentIndex == 4){
      return Alerts();
    }
  }
}
