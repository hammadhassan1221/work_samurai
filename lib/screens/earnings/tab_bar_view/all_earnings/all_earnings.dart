import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/screens/earnings/tab_bar_view/all_earnings/all_earnings_components.dart';

class AllEarnings extends StatefulWidget {
  @override
  _AllEArningsState createState() => _AllEArningsState();
}

class _AllEArningsState extends State<AllEarnings> {
  AllEarningsComponents _allEarningsComponents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allEarningsComponents = AllEarningsComponents();
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
                  _allEarningsComponents.getAllPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _allEarningsComponents.getAllPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _allEarningsComponents.getAllPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _allEarningsComponents.getAllPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _allEarningsComponents.getAllPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                  _allEarningsComponents.getAllPayment(buildContext: context, jobDesc: "We are a very well reputed hotel and on immediate bases I need waiter for the event.", job: "Waiter in Hotel", onPress: (){},value: "\$ 2000"),

                ],
              ))
        ],
      ),
    );
  }
}
