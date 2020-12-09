import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/screens/earning_history/earning_history.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'earning_details_components.dart';

class EarningsDetails extends StatefulWidget {
  @override
  _EarningsDetailsState createState() => _EarningsDetailsState();
}

class _EarningsDetailsState extends State<EarningsDetails> {
  EarningDetailsComponents _earningDetailsComponents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _earningDetailsComponents = EarningDetailsComponents();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.clr_bg,
        child: Column(
          children: [
            CommonWidgets.getAppBar(text: "Earning Details", context: context),
            Expanded(
                child: ListView(
                  children: [
                    _earningDetailsComponents.getPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){Navigator.push(context, SlideRightRoute(page:EarningHistory()));},value: "\$ 2000"),

                    _earningDetailsComponents.getPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                    _earningDetailsComponents.getPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                    _earningDetailsComponents.getPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                    _earningDetailsComponents.getPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                    _earningDetailsComponents.getPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
