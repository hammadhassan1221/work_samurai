import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/home/pages/tracks/track_components.dart';

class Tracks extends StatefulWidget {
  @override
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> with TickerProviderStateMixin {
  TabController _tabController;
  TracksComponents tracksComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    tracksComponents = TracksComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: AppSizes.width,
                    height: AppSizes.height * 0.1,
                    padding: EdgeInsets.only(
                        left: AppSizes.width * 0.04,
                        top: AppSizes.width * 0.07),
                    color: AppColors.clr_bg,
                    child: Text(
                      "Tracks",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: AppColors.clr_bg_black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.muliBold,
                      ),
                    )),
                Container(
                  alignment: Alignment.center,
                  width: AppSizes.width,
                  color: AppColors.clr_white,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.clr_bg_grey,
                    labelColor: AppColors.clr_bg_black,
                    unselectedLabelColor: AppColors.clr_bg_grey,
                    indicator: BoxDecoration(
                        color: AppColors.clr_white,
                        border: Border(
                            bottom: BorderSide(
                          color: AppColors.clr_bg_black,
                          width: 3.0,
                        ))),
                    isScrollable: true,
                    tabs: <Widget>[
                      _tabBar("Upcoming"),
                      _tabBar("In_Progress"),
                      _tabBar("Past"),
                      /*   _tabBar("In-Progress"),
                    _tabBar("Past"),*/
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        tracksComponents.getUpcomingContainer(context),
                        tracksComponents.getProgressContainer(
                          context,
                        ),
                        tracksComponents.getPastContainer(
                          context,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  _tabBar(String tabName) {
    return Container(
      width: AppSizes.width * 0.21,
      child: Tab(
        text: tabName,
      ),
    );
  }
}
