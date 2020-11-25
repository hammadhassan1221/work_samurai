import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/earnings/earnings_components.dart';
import 'package:work_samurai/screens/earnings/tab_bar_view/all_earnings/all_earnings.dart';
import 'package:work_samurai/screens/earnings/tab_bar_view/daily_earning/daily_earnings.dart';
import 'package:work_samurai/screens/earnings/tab_bar_view/monthly_earning/monthly_earning.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Earnings extends StatefulWidget {
  @override
  _EarningsState createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> with TickerProviderStateMixin{
  EarningComponents _earningComponents;
  TabController _tabController;

  bool onClick = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _earningComponents = EarningComponents();
    _tabController = new TabController(length: 3, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              color: AppColors.clr_bg,
              child: Column(
                children: [
                  CommonWidgets.getAppBar(text: "Earning History", context: context),
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.height*0.0125),
                    child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: AppColors.transparentColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.transparentColor,
                      ),
                      tabs: [
                        Container(
                          padding: EdgeInsets.all(AppSizes.width*0.025,),
                          decoration: BoxDecoration(
                            color: AppColors.clr_bg_black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Daily Earnings",style: TextStyle(fontSize: 14,fontFamily:'MuliBold',color: AppColors.clr_white),),
                        ),
                        Container(
                          padding: EdgeInsets.all(AppSizes.width*0.025,),
                          decoration: BoxDecoration(

                            color: AppColors.clr_bg_black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Monthly Earnings",style: TextStyle(fontSize: 14,fontFamily:'MuliBold',color: AppColors.clr_white),),
                        ),
                        Container(
                          padding: EdgeInsets.all(AppSizes.width*0.025,),
                          decoration: BoxDecoration(
                            border: Border.all(
                            ),
                            color: AppColors.clr_bg_black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("All Earnings",style: TextStyle(fontSize: 14,fontFamily:'MuliBold',color: AppColors.clr_white),),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        DailyEarning(),
                        MonthlyEarning(),
                        AllEarnings(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

  }
}
