import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/payment_history/tab_bar_view/daily_payments/daily_components.dart';

class DailyPayments extends StatefulWidget {
  @override
  _DailyPaymentsState createState() => _DailyPaymentsState();
}

class _DailyPaymentsState extends State<DailyPayments> {
  DailyComponents _dailyComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dailyComponents = DailyComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: ListView(
          children: [
            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),

            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),
            _dailyComponents.getDailyPayment(context),
          ],
        )),
      ),
    );
  }
}
