import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Gigs extends StatefulWidget {
  @override
  _GigsState createState() => _GigsState();
}

class _GigsState extends State<Gigs> with TickerProviderStateMixin{
  TabController _tabController;
  GigsComponents _gigsComponents;
  GigsProvider gigsProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gigsComponents = GigsComponents();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height * 0.7,
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child: Column(children: [
        CommonWidgets.getAppBarWithout(text: "Gigs"),
        Container(
          alignment: Alignment.center,
          width: AppSizes.width,
          color: AppColors.clr_white,
          child: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontFamily:'MuliSemiBold'),
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
              _tabBar("Offers"),
              _tabBar("In-Progress"),
              _tabBar("Confirmed"),
            ],
          ),
        ),
        SizedBox(
          height: AppSizes.height*0.01,
        ),
        Container(
          child: Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                _gigsComponents.getOffersContainer(context),
                _gigsComponents.getInProgressContainer(),
                _gigsComponents.getConfirmedContainer(),
              ],
            ),
          ),
        )
      ]),
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
