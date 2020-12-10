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

class Worker extends StatefulWidget {
  @override
  _WorkerState createState() => _WorkerState();
}

class _WorkerState extends State<Worker> with TickerProviderStateMixin{
  TabController _tabController;
  double _value = 0.0;

  var pickedTime;
  WorkerProvider workerProvider;
  WorkerComponents workerComponents;

  final List<Widget> children = [
    Gigs(),
    Schedule(),
    WorkerChatRoom(),
    Account(),
    Alerts(),
  ];




  @override
  void initState() {
    super.initState();
    workerProvider = Provider.of<WorkerProvider>(context, listen: false);
    workerComponents = WorkerComponents();

  }

  @override
  Widget build(BuildContext context) {
    AppSizes.initializeSize(context);
    Provider.of<WorkerProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(child:_currentPage()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: workerProvider.currentIndex,
          backgroundColor: AppColors.clr_white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              workerProvider.setCurrentIndex(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                child:Icon(LineariconsFree.briefcase,color: workerProvider.currentIndex == 0
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,size: 20,)
              ),
              title: Text(
                "Gigs",style: TextStyle(
                color: workerProvider.currentIndex == 0
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.schedule,height: 20,width: 20, color: workerProvider.currentIndex == 1
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,),
              ),
              title: Text(
                "Schedule",style: TextStyle(
                color: workerProvider.currentIndex == 1
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.msgs,height: 20,width: 20, color: workerProvider.currentIndex == 2
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,),
              ),
              title: Text(
                "Messages",style: TextStyle(
                color: workerProvider.currentIndex == 2
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.profile,height: 20,width: 20, color: workerProvider.currentIndex == 3
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,),
              ),
              title: Text(
                "Profile",style: TextStyle(
                color: workerProvider.currentIndex == 3
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.alerts,height: 20,width: 20, color: workerProvider.currentIndex == 4
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,),
              ),
              title: Text(
                "Alerts",style: TextStyle(
                color: workerProvider.currentIndex == 4
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_black2,
              ),
              ),
            ),
          ],
        ),
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
