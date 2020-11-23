import 'package:flutter/cupertino.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/screens/earning_history/earning_history.dart';

import 'daily_earning_components.dart';

class DailyEarning extends StatefulWidget {
  @override
  _DailyEarningState createState() => _DailyEarningState();
}

class _DailyEarningState extends State<DailyEarning> {
  DailyEarningComponents _dailyEarningComponents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dailyEarningComponents = DailyEarningComponents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.clr_bg,
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){Navigator.push(context, SlideRightRoute(page:EarningHistory()));},value: "\$ 2000"),

              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

            ],
          ))
        ],
      ),
    );
  }
}
