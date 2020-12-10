import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/earning_details/earning_details.dart';
import 'package:work_samurai/screens/earnings/earnings_components.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Earnings extends StatefulWidget {
  @override
  _EarningsState createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  EarningComponents _earningComponents;
  DateTime _selectedDate;
  DateTime _fromDate;
  int _currentYear;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _earningComponents = EarningComponents();
    _selectedDate = DateTime.now();
    _fromDate = DateTime.now();
    _currentYear = DateTime.now().year;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.getAppBar(text: "Earnings", context: context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _earningComponents.getDateContainer(
                  onPress: () => _fromPicker(),
                  context: context,
                  iconData: Icons.calendar_today,
                  fromDate: _getFromDate(_selectedDate.toString()),
                ),
                SizedBox(width: AppSizes.width*0.05,),
                _earningComponents.getDateContainer(
                    onPress: () => _toPicker(),
                    context: context,
                    iconData: Icons.calendar_today,
                    fromDate: _getToDate(_fromDate.toString())),
              ],
            ),
            _earningComponents.getAmountContainer(amount: "\$0.00"),
            _earningComponents.getJobContainer(
                text: "Hours Worked", amount: ""),
            _earningComponents.getJobContainer(text: "Jobs", amount: ""),
            Expanded(
                child: CommonWidgets.getSignUpButton(
                    context: context,
                    onPress: () {
                      Navigator.push(
                          context, SlideRightRoute(page: EarningsDetails()));
                    },
                    text: "See Details")),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
          ],
        ),
      ),
    ));
  }

  _fromPicker() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null) {
      setState(() {
        _selectedDate = date;
        _currentYear = date.year;
      });
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Information",
          subHeading:
          "No Date has been selected");
    }
  }

  String _getFromDate(String date) {
    List<String> temp = date.split(" ");
    List<String> tempDate = temp[0].split("-");
    return tempDate[1] + "/" + tempDate[2] + "/" + tempDate[0];
  }

  _toPicker() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null) {
      setState(() {
        _fromDate = date;
        _currentYear = date.year;
      });
    } else {
      ApplicationToast.getWarningToast(
          durationTime: 3,
          heading: "Information",
          subHeading:
          "No Date has been selected");
    }
  }

  String _getToDate(String date) {
    List<String> temp = date.split(" ");
    List<String> tempDate = temp[0].split("-");
    return tempDate[1] + "/" + tempDate[2] + "/" + tempDate[0];
  }
}
