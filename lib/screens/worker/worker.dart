import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/worker_components.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Worker extends StatefulWidget {
  @override
  _WorkerState createState() => _WorkerState();
}

class _WorkerState extends State<Worker> with TickerProviderStateMixin {
  TabController _tabController;
  RangeValues _currentRangeValues = const RangeValues(0, 80);
  int _currentIndex = 0;
  WorkerProvider workerProvider;
  WorkerCmoponents workerComponents;
  var pickedTime;

  @override
  void initState() {
    super.initState();
    workerProvider = Provider.of<WorkerProvider>(context, listen: false);
    workerComponents = WorkerCmoponents();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.initializeSize(context);
    Provider.of<WorkerProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: AppSizes.height,
            width: AppSizes.width,
            color: AppColors.clr_bg,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: AppSizes.height * 0.85,
                      color: AppColors.transparentColor,
                      child: _bottomNavigationContainer(),
                    ))
              ],
            )),
        bottomNavigationBar: Container(
          height: AppSizes.height * 0.1,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: AppColors.clr_bg,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    Assets.gigs,
                    height: 20,
                    width: 20,
                    color: _currentIndex == 0
                        ? AppColors.clr_bg_black
                        : AppColors.clr_bg_grey,
                  ),
                ),
                title: Text(
                  "Gigs",
                  style: TextStyle(
                    color: _currentIndex == 0
                        ? AppColors.clr_bg_black
                        : AppColors.clr_bg_grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.schedule,
                  height: 20,
                  width: 20,
                  color: _currentIndex == 1
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
                title: Text(
                  "Schedule",
                  style: TextStyle(
                    color: _currentIndex == 1
                        ? AppColors.clr_bg_black
                        : AppColors.clr_bg_grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.msgs,
                  height: 20,
                  width: 20,
                  color: _currentIndex == 2
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
                title: Text(
                  "Messages",
                  style: TextStyle(
                    color: _currentIndex == 2
                        ? AppColors.clr_bg_black
                        : AppColors.clr_bg_grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.profile,
                  height: 20,
                  width: 20,
                  color: _currentIndex == 3
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: _currentIndex == 3
                        ? AppColors.clr_bg_black
                        : AppColors.clr_bg_grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.alerts,
                  height: 20,
                  width: 20,
                  color: _currentIndex == 4
                      ? AppColors.clr_bg_black
                      : AppColors.clr_bg_grey,
                ),
                title: Text(
                  "Alerts",
                  style: TextStyle(
                    color: _currentIndex == 4
                        ? AppColors.clr_bg_black
                        : AppColors.clr_bg_grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavigationContainer() {
    if (_currentIndex == 0) {
      return SafeArea(
        child: Container(
          height: AppSizes.height * 0.8,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(children: [
            Container(
                width: AppSizes.width,
                height: AppSizes.height * 0.08,
                padding: EdgeInsets.only(left: 10.0, top: 20.0),
                margin: EdgeInsets.only(left: 10.0),
                color: AppColors.clr_white,
                child: Text(
                  "Gigs",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: Assets.muliBold,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
              alignment: Alignment.center,
              width: AppSizes.width,
              color: AppColors.clr_white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.clr_bg_grey,
                labelColor: AppColors.clr_bg_black,
                unselectedLabelColor: AppColors.clr_bg_grey,
                indicator: BoxDecoration(
                    color: AppColors.clr_white,
                    border: Border(
                        bottom: BorderSide(
                      color: AppColors.clr_bg_black,
                      width: 3.0,
                    ))),
                isScrollable: true,
                tabs: <Widget>[
                  _tabBar("Offers"),
                  _tabBar("In-Progress"),
                  _tabBar("Confirmed"),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.height * 0.01,
            ),
            Container(
              child: Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    workerComponents.getOffersContainer(context),
                    workerComponents.getInProgressContainer(() {
                      _alertBreakContainer();
                    }),
                    workerComponents.getConfirmedContainer(),
                  ],
                ),
              ),
            )
          ]),
        ),
      );
    }
    //workerComponents.getIndexZeroContainer();
    else if (_currentIndex == 1) {
      return SafeArea(
        child: Container(
          height: AppSizes.height * 0.8,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(children: [
            Container(
                width: AppSizes.width,
                height: AppSizes.height * 0.1,
                padding: EdgeInsets.only(left: 10.0, top: 20.0),
                color: AppColors.clr_white,
                child: Text(
                  "Your Schedule",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: Assets.muliBold,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: AppSizes.height * 0.02,
            ),
            Container(
                width: AppSizes.width * 0.9,
                height: AppSizes.height * 0.72,
                color: AppColors.clr_bg,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.location,
                                width: AppSizes.width * 0.08,
                                height: AppSizes.height * 0.04,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Assets.muliRegular,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "New York, USA",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Assets.muliRegular,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.distance,
                                width: AppSizes.width * 0.08,
                                height: AppSizes.height * 0.04,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                "Distance",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Assets.muliRegular,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "40 km",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: Assets.muliRegular,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppSizes.width,
                      child: RangeSlider(
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
                        activeColor: AppColors.clr_bg_black,
                        inactiveColor: AppColors.clr_bg_grey,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _alertDialogueContainer();
                            },
                            child: Container(
                              height: AppSizes.height * 0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  border:
                                      Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mon",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Assets.muliSemiBold,
                                          fontWeight: FontWeight.w200

                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "10:00 am - 5:00 pm",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Assets.muliRegular,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: (){
                              _alertDialogueContainer();
                            },
                            child: Container(
                              height: AppSizes.height * 0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  border:
                                      Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tues",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Assets.muliSemiBold,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "10:00 am - 5:00 pm",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Assets.muliRegular,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              _alertDialogueContainer();
                            },
                            child: Container(
                              height: AppSizes.height * 0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0, 0),
                                    )
                                  ],
                                  border:
                                      Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Wed",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Assets.muliSemiBold,

                                          color: AppColors.clr_bg_grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Not Available",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Assets.muliRegular,
                                          color: AppColors.clr_bg_grey,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            height: AppSizes.height * 0.1,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.clr_bg_grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                border:
                                    Border.all(color: AppColors.clr_bg_grey),
                                color: AppColors.clr_white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Thurs",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliSemiBold,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Not Available",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
                                        color: AppColors.clr_bg_grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            height: AppSizes.height * 0.1,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.clr_bg_grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                border:
                                    Border.all(color: AppColors.clr_bg_grey),
                                color: AppColors.clr_white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Fri",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliSemiBold,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10:00 am - 5:00 pm",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            height: AppSizes.height * 0.1,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.clr_bg_grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                border:
                                    Border.all(color: AppColors.clr_bg_grey),
                                color: AppColors.clr_white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sat",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliSemiBold,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Available All Day",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            height: AppSizes.height * 0.1,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.clr_bg_grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 1,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                border:
                                    Border.all(color: AppColors.clr_bg_grey),
                                color: AppColors.clr_white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sun",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliSemiBold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Available All Day",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliRegular,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ]),
        ),
      );
    } else if (_currentIndex == 2) {
      return workerComponents.getMessages(context);
    } else if (_currentIndex == 3) {
      return workerComponents.getProfile();
    } else {
      return Container();
    }
  }

  _tabBar(String tabName) {
    return Container(
      width: AppSizes.width * 0.21,
      child: Tab(
        text: tabName,
      ),
    );
  }

  _bottomSheetContainer() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: AppSizes.height * 0.80,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CommonWidgets.getRow("Monday", false, () {}),
                    CommonWidgets.getAvailability("Available From"),
                    CommonWidgets.getAvailability2("Available To"),
                    /* Container(width: AppSizes.width,
                   height: AppSizes.height*0.4,
                   color: AppColors.clr_white,
                   child: _dateTime(),),*/

                    SizedBox(
                      height: AppSizes.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: AppSizes.height * 0.07,
                        width: AppSizes.width,
                        decoration: BoxDecoration(
                            color: AppColors.clr_bg_black,
                            borderRadius: BorderRadius.circular(6)),
                        child: _alignContainer(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _alignContainer() {
    return Container(
      child: Text(
        "Save Availability",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _dateTime() {
    DatePicker.showTime12hPicker(context,
        theme: DatePickerTheme(
            containerHeight: AppSizes.height*0.50,
            cancelStyle: TextStyle(color: AppColors.transparentColor)),
        showTitleActions: true,
        currentTime: DateTime.now(), onConfirm: (time) {
      setState(() {
        pickedTime =
            "Picked time is : ${time.hour} : ${time.minute} : ${time.second}";
      });
    });
  }

  _alertDialogueContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.black.withOpacity(0.5),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: AppSizes.width * 0.08,
                        right: AppSizes.width * 0.08),
                    height: AppSizes.height * 0.25,
                    width: AppSizes.width,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: AppSizes.height * 0.30,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.05,
                          right: AppSizes.width * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  CommonWidgets.getRow("Monday", false, () {}),
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showTime12hPicker(context,
                                          showTitleActions: true,
                                          currentTime: DateTime.now(),
                                          onConfirm: (time) {
                                        setState(() {});
                                      });
                                    },
                                    child: CommonWidgets.getAvailability(
                                        "Available From"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showTime12hPicker(context,
                                          showTitleActions: true,
                                          currentTime: DateTime.now(),
                                          onConfirm: (time) {
                                        setState(() {});
                                      });
                                    },
                                    child: CommonWidgets.getAvailability2(
                                        "Available To"),
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      hideLoader(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: AppSizes.height * 0.07,
                                      width: AppSizes.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.clr_bg_black,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: _alignContainer(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      },
    };
  }
  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  _alertBreakContainer() {
    return {
      {
        showDialog(
          context: context,
          builder: (_) {
            return Material(
              color: Colors.black.withOpacity(0.5),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: AppSizes.width * 0.08,
                        right: AppSizes.width * 0.08),
                    height: AppSizes.height * 0.25,
                    width: AppSizes.width,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: AppSizes.height * 0.35,
                      width: AppSizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(233, 233, 211, 0)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.05,
                          right: AppSizes.width * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: AppSizes.height * 0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Break Duration",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap:(){
                                                DatePicker.showTime12hPicker(context,
                                                    theme: DatePickerTheme(
                                                        containerHeight: 100,
                                                        cancelStyle: TextStyle(color: AppColors.transparentColor)),
                                                    showTitleActions: true,
                                                    currentTime: DateTime.now(), onConfirm: (time) {
                                                      setState(() {
                                                        pickedTime =
                                                        "Picked time is : ${time.hour} : ${time.minute} : ${time.second}";
                                                      });
                                                    });
                                              },
                                              child: Text("15 mins",
                                                  style: TextStyle(
                                                    color: AppColors.clr_bg_black,
                                                    fontSize: 14,
                                                  )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSizes.height * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      hideLoader(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: AppSizes.height * 0.07,
                                      width: AppSizes.width,
                                      decoration: BoxDecoration(
                                          color: AppColors.clr_bg_black,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: _breakContainer(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      },
    };
  }
  _breakContainer() {
    return Container(
      child: Text(
        "Request Break",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
