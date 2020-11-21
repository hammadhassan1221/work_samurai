import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/screens/earnings/tab_bar_view/monthly_earning/monthly_earning_component.dart';

class MonthlyEarning extends StatefulWidget {
  @override
  _MonthlyEarningState createState() => _MonthlyEarningState();
}

class _MonthlyEarningState extends State<MonthlyEarning> {
  MonthlyComponents _monthlyComponents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _monthlyComponents = MonthlyComponents();
  }

  Widget build(BuildContext context) {
    return Container(
      color: AppColors.clr_bg,
      child: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  _monthlyComponents.getMonthlyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _monthlyComponents.getMonthlyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _monthlyComponents.getMonthlyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _monthlyComponents.getMonthlyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _monthlyComponents.getMonthlyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _monthlyComponents.getMonthlyPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                ],
              ))
        ],
      ),
    );
  }

}
