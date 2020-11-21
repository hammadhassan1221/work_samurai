import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/colors.dart';

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
              _dailyEarningComponents.getDailyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

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
