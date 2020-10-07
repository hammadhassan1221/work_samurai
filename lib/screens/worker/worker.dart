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

class _WorkerState extends State<Worker> {
  RangeValues _currentRangeValues = const RangeValues(0, 80);
  int _currentIndex = 0;
  WorkerProvider workerProvider;
  WorkerCmoponents workerComponents;

  @override
  void initState() {
    super.initState();
    workerProvider = Provider.of<WorkerProvider>(context, listen: false);
    workerComponents = WorkerCmoponents();
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
                        height: AppSizes.height *0.8,
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
      return Container();
    }

    //workerComponents.getIndexZeroContainer();
    else if (_currentIndex == 1) {
      return SafeArea(
        child: Container(
          height: AppSizes.height*0.8,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
            children: [
              Container(
                width: AppSizes.width,
                height: AppSizes.height*0.1,
                padding: EdgeInsets.only(left: 10.0, top: 20.0),
                color: AppColors.clr_white,
                child: Text(
                  "Your Schedule",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: Assets.muliBold,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              SizedBox(
                height: AppSizes.height*0.02,
              ),
              Container(
                width: AppSizes.width*0.9,
                height: AppSizes.height*0.72,
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
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
                              height: AppSizes.height*0.02,
                            ),
                            Container(
                              height: AppSizes.height*0.1,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.clr_bg_grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                      offset: Offset(0,0),
                                    )
                                  ],
                                  border: Border.all(color: AppColors.clr_bg_grey),
                                  color: AppColors.clr_white
                              ),
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
              )
          )
        ]),
        ),
      );
    }
    else if (_currentIndex == 2) {
      return SafeArea(
        child: Container(
          height: AppSizes.height*0.8,
          width: AppSizes.width,
          color: AppColors.clr_bg,
          child: Column(
              children: [
                Container(
                    width: AppSizes.width,
                    height: AppSizes.height*0.1,
                    padding: EdgeInsets.only(left: 15.0, top: 20.0),
                    color: AppColors.clr_white,
                    child: Text(
                      "Messages",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: Assets.muliBold,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                SizedBox(
                  height: AppSizes.height*0.02,
                ),
                Container(
                    width: AppSizes.width*0.9,
                    height: AppSizes.height*0.65,
                    color: AppColors.clr_bg,
                    child: Column(
                      children: [
                        Container(
                          height: AppSizes.height*0.1,
                          width: AppSizes.width*0.9,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.clr_bg_grey,
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Assets.support,
                                    width: AppSizes.width * 0.08,
                                    height: AppSizes.height * 0.04,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width*0.01,
                                  ),
                                  Text(
                                    "Work Sumarai Support",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: Assets.muliBold,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.height*0.02,
                        ),
                        Container(
                          height: AppSizes.height*0.1,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.clr_bg_grey,
                                  spreadRadius: 0.5,
                                  blurRadius: 1,
                                  offset: Offset(0,0),
                                )
                              ],
                              border: Border.all(color: AppColors.clr_bg_grey),
                              color: AppColors.clr_white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(Assets.support),
                              SizedBox(
                                width: AppSizes.width*0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          "Crown Hotel",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Assets.muliBold,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      SizedBox(
                                        width: AppSizes.width*0.01,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: AppColors.clr_bg_grey,
                                          )
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              Assets.star,
                                            width: 10,
                                            height: 10),
                                            Text(
                                              "4.5",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Assets.muliRegular,
                                                color: AppColors.clr_bg_grey,
                                              )
                                            )
                                          ],
                                        )


                                      )
                                    ],
                                  ),
                                  Text(
                                      "Waiter . Wed, Sep 23",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.clr_bg_grey,
                                        fontFamily: Assets.muliRegular,
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
              ]),
        ),
      );
    }
    else if (_currentIndex == 3){
      return ListView(
        children: [
          workerComponents.getProfile(),
        ],
      );
    }
    else {
      return Container();
    }
  }
}
