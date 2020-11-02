import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/payment_history/payment_components.dart';
import 'package:work_samurai/screens/business/payment_history/tab_bar_view/daily_payments/daily_payments.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> with TickerProviderStateMixin{
  PaymentComponents _paymentComponents;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paymentComponents = PaymentComponents();
    _tabController = new TabController(length: 3, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
        child: Scaffold(
          body: Container(
            color: AppColors.clr_field,
            child: Column(
              children: [
                _paymentComponents.getAppBar(text: "Payment History", context: context),
                Container(
                 margin: EdgeInsets.only(top: AppSizes.height*0.02),
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
                        width: AppSizes.width * 0.30 ,
                        decoration: BoxDecoration(
                          border: Border.all(
                          ),
                          color: AppColors.clr_bg_black,
                          borderRadius: BorderRadius.circular(08),
                        ),
                        child: Tab(

                          child: Text("Daily Payments",style: TextStyle(fontSize: 14,fontFamily:'MuliBold',color: AppColors.clr_white),),
                        ),
                      ),
                      Container(
                        width: AppSizes.width * 0.35 ,

                        decoration: BoxDecoration(
                          border: Border.all(
                          ),
                          color: AppColors.clr_bg_black,
                          borderRadius: BorderRadius.circular(08),
                        ),
                        child: Tab(

                          child: Text("Monthly Payments",style: TextStyle(fontSize: 14,fontFamily:'MuliBold',color: AppColors.clr_white),),
                        ),
                      ),
                      Container(
                        width: AppSizes.width * 0.30 ,

                        decoration: BoxDecoration(
                          border: Border.all(
                          ),
                          color: AppColors.clr_bg_black,
                          borderRadius: BorderRadius.circular(08),
                        ),
                        child: Tab(

                          child: Text("All Payments",style: TextStyle(fontSize: 14,fontFamily:'MuliBold',color: AppColors.clr_white),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      DailyPayments(),
                      //MonthlyPayments(),
                      //AllPayments(),
                      Container(
                        color: Colors.teal,
                      ),
                      Container(
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));

  }
}
