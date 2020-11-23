import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
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
    return SafeArea(
      child: Container(
        height:AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                _earningHistoryComponents.getAppBar(text: "Earning History", context: context),
            _earningHistoryComponents.getHeadings(text: "Job Title"),
            _earningHistoryComponents.getSubHeading(text: "Waiter in Hotel"),
            _earningHistoryComponents.getHeadings(text: "Job Description"),
            _earningHistoryComponents.getSubHeading(text: "Donec dapibus mauris id odio ornare tempus amet accumsan justo, quis tempor ligula. Qui haretra felis. Ut quis consequat orci, at conseq Suspendisse auctor laoreet placerat. Nam et r lacus dignissim lacinia sit amet nec eros. Null quis libero pharetra varius. Nulla tellus nunc, ada at scelerisque eget, cursus at eros. Maec ntesque lacus quis erat eleifend sagittis. Sed v us ante, quis mattis neque. Nullam dapibus er ulla cursus accumsan. Nulla volutpat libero la natis sodales. Ut in pellentesque velit."),
            _earningHistoryComponents.getHeadings(text: "Job Payment"),
            _earningHistoryComponents.getSubHeading(text: "Price: \$ 2000."),
            _earningHistoryComponents.getSignUpButton(context: context, onPress: (){}, text: "Download Pdf")
          ],
        ),
      ),
    );
  }
}
