import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';

class Worker extends StatefulWidget {
  @override
  _WorkerState createState() => _WorkerState();
}

class _WorkerState extends State<Worker> {
  int _currentIndex = 0;
  WorkerProvider workerProvider;

  @override
  void initState() {
    super.initState();
    workerProvider = Provider.of<WorkerProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<WorkerProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: AppSizes.height,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: AppSizes.height *0.8,
                    color: AppColors.transparentColor,
                    child: _bottomNavigationContainer(),
                  ))
            ],
          )),
      bottomNavigationBar: Container(
        height: AppSizes.height * 0.1,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: AppColors.clr_bg,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  Assets.gigs,
                  color: _currentIndex == 0
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
              ),
              title: Text(
                "Gigs",
                style: TextStyle(
                  color: _currentIndex == 0
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.schedule,
                color: _currentIndex == 1
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_grey,
              ),
              title: Text(
                "Schedule",
                style: TextStyle(
                  color: _currentIndex == 1
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.msgs,
                color: _currentIndex == 2
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_grey,
              ),
              title: Text(
                "Messages",
                style: TextStyle(
                  color: _currentIndex == 2
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.profile,
                color: _currentIndex == 3
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_grey,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: _currentIndex == 3
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                Assets.alerts,
                color: _currentIndex == 4
                    ? AppColors.clr_bg_black
                    : AppColors.clr_bg_grey,
              ),
              title: Text(
                "Alerts",
                style: TextStyle(
                  color: _currentIndex == 4
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationContainer() {
    if (_currentIndex == 0) {
      return Container();
    }
    else if (_currentIndex == 1) {
      return Container();
    }
    else if (_currentIndex == 2) {
      return Container;
    }
    else if (_currentIndex == 3){
      return Container();
    }
    else {
      return Container();
    }
  }
}
