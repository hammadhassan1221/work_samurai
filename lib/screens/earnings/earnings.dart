import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/documents/documents_provider.dart';
import 'package:work_samurai/screens/earning_details/earning_details.dart';
import 'package:work_samurai/screens/earnings/earnings_components.dart';
import 'package:work_samurai/screens/earnings/earnings_providers.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:work_samurai/models/api_models/earning_screen/earning_response.dart';

class Earnings extends StatefulWidget {
  @override
  _EarningsState createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  EarningComponents _earningComponents;
  DateTime _selectedDate;
  DateTime _fromDate;
  String earnedAmount = "\$0.0";
  String hours = "0";
  String jobs = "0";
  String fees = "0";
  int _currentYear;
  TextEditingController _totalAmount;
  TextEditingController _dateController = TextEditingController();
  var myFormat = DateFormat('dd-MM-yyyy');
  var myFormat1 = DateFormat('dd-MM-yyyy');
  bool forward;
  EarningProviders _earningProviders;

  @override
  void initState() {
    super.initState();
    _earningComponents = EarningComponents();
    _selectedDate = DateTime.now();
    _fromDate = DateTime.now().add(Duration(days: 7));
    forward = false;
    _earningProviders = Provider.of<EarningProviders>(context, listen: false);


    DateTime dateTime = DateTime.parse(_selectedDate.toString());

    String strDate = _selectedDate.toString();
    List<String> arrDateAndTime = strDate.split(" ");
    arrDateAndTime = arrDateAndTime[0].toString().split("-");
    _earningProviders.init(fromDate: myFormat.format(_selectedDate),toDate:  myFormat1.format(_fromDate) ,context: context);

  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EarningProviders>(context, listen: true);
    return Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: _earningProviders.isUpdated ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.getAppBarAccount(text: "Earnings", context: context),
            _earningComponents.getAmountByDateContainer(
              context,
              //
              "${myFormat.format(_selectedDate)}",
              "${myFormat1.format(_fromDate)}",
                  () {
                setState(() {
                  _selectedDate = _selectedDate.subtract(Duration(days: 7));
                  _fromDate = _fromDate.subtract(Duration(days: 7));
                  _earningProviders.getUserEarnings1(context: context, fromDate: myFormat.format(_selectedDate), toDate: myFormat.format(_fromDate));
                });
              },
              _earningProviders.earning.data.totalEarnings + " ", () {

              setState(() {
                _selectedDate = _selectedDate.add(Duration(days: 7));
                _fromDate = _fromDate.add(Duration(days: 7));
                _earningProviders.getUserEarnings1(context: context, fromDate: myFormat.format(_selectedDate), toDate: myFormat.format(_fromDate));
              });
            },
            ),
            _earningComponents.getAmountContainer(
                amount: "Total Jobs:                " +  _earningProviders.earning.data.jobsCompleted.toString()),
            _earningComponents.getJobContainer(
                text: "Total Hours:              " , amount: _earningProviders.earning.data.duration ),
            _earningComponents.getJobContainer(
                text: "Fees Applied:            " "\$$fees", amount: ""),
            Spacer(),
            CommonWidgets.getBottomButton(
                name: "See Details",
                onButtonClick: () {
                  if (_earningProviders.earning.data.jobs != null){
                    Navigator.push(
                        context, SlideRightRoute(page: EarningsDetails(earningObj: _earningProviders.earning)));
                  }
                 else {
                    ApplicationToast.getWarningToast(durationTime: 3, heading: "Warning", subHeading: "no data found");
                  }
                }),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
          ],
        ): Container(
          height: 20,
          width: 20,
          child:
          Lottie.asset(Assets.loader),
        ),
      ),
    );
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
          subHeading: "No Date has been selected");
    }
  }

  Future<String> _dateSelection(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    setState(() {
      _selectedDate = picked ?? _selectedDate;
    });
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
          subHeading: "No Date has been selected");
    }
  }

  String _getToDate(String date) {
    List<String> temp = date.split(" ");
    List<String> tempDate = temp[0].split("-");
    return tempDate[1] + "/" + tempDate[2] + "/" + tempDate[0];
  }
}

/*CommonWidgets.getBottomButton(name: "See Details", onButtonClick: (() async{
              int days = _fromDate.difference(_selectedDate).inDays;
              if(days<20){
                ApplicationToast.getErrorToast(durationTime: 3, heading: null, subHeading: "please select atleast 20 days");
                return;
              }
              EarningResponse result =await EarningProviders().getUserEarning( _getToDate(_selectedDate.toString()),_getToDate(_fromDate.toString()),context);
              if(result != null){
                setState(() {
                  earnedAmount = result.totalEarning;
                  jobs = result.jobCompleted.toString();
                });
              }
            })),*/
