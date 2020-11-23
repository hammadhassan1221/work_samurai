import 'package:flutter/cupertino.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/earning_history/earning_history_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class EarningHistory extends StatefulWidget {
  @override
  _EarningHistoryState createState() => _EarningHistoryState();
}

class _EarningHistoryState extends State<EarningHistory> {
  EarningHistoryComponents _earningHistoryComponents;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _earningHistoryComponents = EarningHistoryComponents();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:AppSizes.height,
      width: AppSizes.width,
      child: Column(
        children: [
              _earningHistoryComponents.getAppBar(text: "Earning History", context: context)
        ],
      ),
    );
  }
}
