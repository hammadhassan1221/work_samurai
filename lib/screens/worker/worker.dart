import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/worker_components.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';

class Worker extends StatefulWidget {
  @override
  _WorkerState createState() => _WorkerState();
}

class _WorkerState extends State<Worker> with TickerProviderStateMixin{
  TabController _tabController;
  RangeValues _currentRangeValues = const RangeValues(0, 80);
  int _currentIndex = 0;
  WorkerProvider workerProvider;
  WorkerCmoponents workerComponents;

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
                    child: Flexible(
                      child: Container(
                        height: AppSizes.height * 0.85,
                        color: AppColors.transparentColor,
                        child: _bottomNavigationContainer(),
                      ),
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
                margin: EdgeInsets.only(left:10.0),
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
                      width:3.0,
                    )
                  )
                ),
                isScrollable: true,
                tabs: <Widget>[
                  _tabBar("Offers"),
                  _tabBar("In-Progress"),
                  _tabBar("Confirmed"),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.height*0.01,
            ),
            Container(
              child: Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      child: ListView(
                        children: [
                          Container(
                            width: AppSizes.width*0.9,
                            child: Column(
                              children: [
                                Container(
                                    width: AppSizes.width*0.9,
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
                                        border: Border.all(color: AppColors.clr_bg_grey),
                                        color: AppColors.clr_white),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: AppSizes.height*0.18,
                                          padding: EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Waiter",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: Assets.muliBold,
                                                          fontWeight: FontWeight.bold,
                                                          color: AppColors.clr_bg_black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Wed, Sep 23",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        "11:00 am - 1:00 pm",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppSizes.height*0.01,
                                                      ),
                                                      Text(
                                                        "Crown Hotel, New York",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: AppColors.clr_bg_grey,
                                                      ),
                                                      Text(
                                                        "140",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontFamily: Assets.muliRegular,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "20/h",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: Assets.muliRegular,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                        right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                                    width: AppSizes.width*0.44,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.clear,
                                                          color:AppColors.clr_bg_black,
                                                        ),
                                                        Text(
                                                            "Skip",
                                                            style: TextStyle(
                                                              color: AppColors.clr_bg_black,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    width: AppSizes.width*0.44,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check,
                                                          color:AppColors.clr_green,
                                                        ),
                                                        Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                              color: AppColors.clr_green,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: AppSizes.height*0.02,
                                ),
                                Container(
                                    width: AppSizes.width*0.9,
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
                                        border: Border.all(color: AppColors.clr_bg_grey),
                                        color: AppColors.clr_white),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: AppSizes.height*0.18,
                                          padding: EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Bartender",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: Assets.muliBold,
                                                          fontWeight: FontWeight.bold,
                                                          color: AppColors.clr_bg_black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Wed, Sep 23",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        "11:00 am - 1:00 pm",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppSizes.height*0.01,
                                                      ),
                                                      Text(
                                                        "Crown Hotel, New York",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: AppColors.clr_bg_grey,
                                                      ),
                                                      Text(
                                                        "140",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontFamily: Assets.muliRegular,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "20/h",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: Assets.muliRegular,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                        right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                                    width: AppSizes.width*0.44,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.clear,
                                                          color:AppColors.clr_bg_black,
                                                        ),
                                                        Text(
                                                            "Skip",
                                                            style: TextStyle(
                                                              color: AppColors.clr_bg_black,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    width: AppSizes.width*0.44,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check,
                                                          color:AppColors.clr_green,
                                                        ),
                                                        Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                              color: AppColors.clr_green,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: AppSizes.height*0.04,
                                ),
                                Container(
                                    child: Text(
                                        "Apply",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.clr_bg_black,
                                        ),
                                      textAlign: TextAlign.left,
                                    )
                                ),
                                SizedBox(
                                  height: AppSizes.height*0.02,
                                ),
                                Container(
                                    width: AppSizes.width*0.9,
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
                                        border: Border.all(color: AppColors.clr_bg_grey),
                                        color: AppColors.clr_white),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: AppSizes.height*0.18,
                                          padding: EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Chef",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: Assets.muliBold,
                                                          fontWeight: FontWeight.bold,
                                                          color: AppColors.clr_bg_black,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Wed, Sep 23",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        "11:00 am - 1:00 pm",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppSizes.height*0.01,
                                                      ),
                                                      Text(
                                                        "Crown Hotel, New York",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors.clr_bg_grey,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: AppColors.clr_bg_grey,
                                                      ),
                                                      Text(
                                                        "140",
                                                        style: TextStyle(
                                                          fontSize: 22,
                                                          fontFamily: Assets.muliRegular,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "20/h",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: Assets.muliRegular,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                        right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                                    width: AppSizes.width*0.44,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.clear,
                                                          color:AppColors.clr_bg_black,
                                                        ),
                                                        Text(
                                                            "Skip",
                                                            style: TextStyle(
                                                              color: AppColors.clr_bg_black,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(left:50.0, right:10.0, top:10.0,bottom:10.0),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    width: AppSizes.width*0.44,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check,
                                                          color:AppColors.clr_green,
                                                        ),
                                                        Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                              color: AppColors.clr_green,
                                                            )
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            )
                          )

                        ],
                      )
                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              height: AppSizes.height*0.4,
                              width: AppSizes.width*0.9,
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
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white),
                              child: Column(
                                children: [
                                  Container(
                                    height: AppSizes.height*0.18,
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Receptionist",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: Assets.muliBold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.clr_bg_black,
                                                  ),
                                                ),
                                                Text(
                                                  "Wed, Sep 23",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                ),
                                                Text(
                                                  "11:00 am - 1:00 pm",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: AppSizes.height*0.01,
                                                ),
                                                Text(
                                                  "Crown Hotel, New York",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "140",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: Assets.muliRegular,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "20/h",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: Assets.muliRegular,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                    padding: EdgeInsets.only(right: 10.0, left:10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.brightness_1,
                                              color: AppColors.clr_bg_grey,
                                            ),
                                            SizedBox(
                                              width: AppSizes.width*0.02,
                                            ),
                                            Text(
                                              "Check-up Time",
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
                                              "10:02 am",
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
                                  Divider(),
                                  Container(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "04 : 22 : 53",
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      )
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: AppSizes.width * 0.9,
                              height: AppSizes.height * 0.08,
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(
                                  top: AppSizes.height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                border: Border.all(color: AppColors.clr_bg_black,),
                                color: AppColors.transparentColor,
                              ),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Request Break",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: AppSizes.width * 0.9,
                              height: AppSizes.height * 0.08,
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.only(
                                  top: AppSizes.height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                border: Border.all(color: AppColors.clr_bg_black,),
                                color: AppColors.clr_bg_black,
                              ),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "End Shift",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    color: AppColors.clr_white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                        child: Column(
                          children: [
                            Container(
                              width: AppSizes.width*0.9,
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
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white),
                              child: Column(
                                children: [
                                  Container(
                                    height: AppSizes.height*0.18,
                                    padding: EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Receptionist",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: Assets.muliBold,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.clr_bg_black,
                                                  ),
                                                ),
                                                Text(
                                                  "Wed, Sep 23",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                ),
                                                Text(
                                                  "11:00 am - 1:00 pm",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: AppSizes.height*0.01,
                                                ),
                                                Text(
                                                  "Crown Hotel, New York",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: AppColors.clr_bg_grey,
                                                ),
                                                Text(
                                                  "140",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: Assets.muliRegular,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "20/h",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: Assets.muliRegular,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                  right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                ),
                                                color: Colors.white,
                                              ),
                                              padding: EdgeInsets.only(left:15.0, right:10.0, top:10.0,bottom:10.0),
                                              width: AppSizes.width*0.44,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.clear,
                                                    color:AppColors.clr_red,
                                                  ),
                                                  Text(
                                                      "Cancel Gig",
                                                      style: TextStyle(
                                                        color: AppColors.clr_red,
                                                      )
                                                  ),
                                                ],
                                              )
                                          ),
                                          Container(
                                              padding: EdgeInsets.only(left:15.0, right:10.0, top:4.0,bottom:10.0),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                ),
                                                color: Colors.white,
                                              ),
                                              width: AppSizes.width*0.44,
                                              child: Row(
                                                children: [
                                                  Image.asset(Assets.start_gig,
                                                      height: 30,
                                                      width: 30),
                                                  Text(
                                                      "Start Gig",
                                                      style: TextStyle(
                                                        color: AppColors.clr_bg_black,
                                                      )
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              )
                            ),
                            SizedBox(
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                                width: AppSizes.width*0.9,
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
                                    border: Border.all(color: AppColors.clr_bg_grey),
                                    color: AppColors.clr_white),
                                child: Column(
                                  children: [
                                    Container(
                                      height: AppSizes.height*0.18,
                                      padding: EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Cleaner",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: Assets.muliBold,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.clr_bg_black,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Wed, Sep 23",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: AppColors.clr_bg_grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    "11:00 am - 1:00 pm",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: AppColors.clr_bg_grey,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: AppSizes.height*0.01,
                                                  ),
                                                  Text(
                                                    "Crown Hotel, New York",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: AppColors.clr_bg_grey,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: AppColors.clr_bg_grey,
                                                  ),
                                                  Text(
                                                    "140",
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontFamily: Assets.muliRegular,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "20/h",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: Assets.muliRegular,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        child: Row(
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                    right: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                padding: EdgeInsets.only(left:15.0, right:10.0, top:10.0,bottom:10.0),
                                                width: AppSizes.width*0.44,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.clear,
                                                      color:AppColors.clr_red,
                                                    ),
                                                    Text(
                                                        "Cancel Gig",
                                                        style: TextStyle(
                                                          color: AppColors.clr_red,
                                                        )
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(left:15.0, right:10.0, top:4.0,bottom:10.0),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(width: 2.0, color: AppColors.clr_bg_grey),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                width: AppSizes.width*0.44,
                                                child: Row(
                                                  children: [
                                                    Image.asset(Assets.start_gig,
                                                        height: 30,
                                                        width: 30),
                                                    Text(
                                                        "Start Gig",
                                                        style: TextStyle(
                                                          color: AppColors.clr_bg_black,
                                                        )
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ),
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
                                      "Mon",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
                                      "Tues",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
                                      "Wed",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
                                        fontFamily: Assets.muliBold,
                                        fontWeight: FontWeight.bold,
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
    }
    else if (_currentIndex == 2) {
      return workerComponents.getMessages();
    }
    else if (_currentIndex == 3) {
      return workerComponents.getProfile();
    }
    else {
      return Container();
    }
  }

  _tabBar(String tabName) {
    return Container(
      width: AppSizes.width * 0.2,
      child: Tab(
        text: tabName,
      ),
    );
  }
}
