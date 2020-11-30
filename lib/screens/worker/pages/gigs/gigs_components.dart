import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/jobs_in_progress_response.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

class GigsComponents {
  String getTime(String dateTime) {
    if (dateTime != null) {
      List<String> temp = dateTime.split(" ");
      return temp[1] + temp[2];
    } else {
      return "10:30 PM";
    }
  }

  String _getTotalAmount(double valueA, double valueB) =>
      (valueA * valueB).toString();

  /*Widget getOffersContainer({@required BuildContext context, @required FutureJobsResponse futureJobsResponse}) {
    return Container(
        child: Container(
            child: ListView.builder(
              itemCount: futureJobsResponse.data.length,
              itemBuilder: (context, index) {
                return Container(
                    width: AppSizes.width,
                    margin: EdgeInsets.only(top: AppSizes.width*0.03,left: AppSizes.width*0.05, right: AppSizes.width*0.05),
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
                        GestureDetector(
                          onTap: () {
                            _newTaskModalBottomSheet(context);
                          },
                          child: Container(

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
                                          futureJobsResponse.data[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Assets.muliSemiBold,
                                            color: AppColors.clr_bg_black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppSizes.height * 0.015,
                                        ),
                                        Text(
                                          futureJobsResponse.data[index].completedDate.toString()  ,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.clr_bg_grey,
                                          ),
                                        ),
                                        Text(
                                          getTime(futureJobsResponse
                                              .data[index].startDate) +
                                              " - " +
                                              getTime(futureJobsResponse
                                                  .data[index].completedDate),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.clr_bg_grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppSizes.height * 0.01,
                                        ),
                                        Container(
                                          width: AppSizes.width*0.65,
                                          child: Text(
                                            futureJobsResponse.data[index].description,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
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
                                        IconButton(
                                          onPressed: () {
                                            _newTaskModalBottomSheet(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "\$" + _getTotalAmount(futureJobsResponse.data[index].rate, futureJobsResponse.data[index].estimatedDuration),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: Assets.muliSemiBold,
                                          ),
                                        ),
                                        Text(
                                          "\$" + futureJobsResponse.data[index].rate.toString() + "/h",
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
                        ),
                        Container(
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 2.0, color: AppColors.clr_bg_grey),
                                        right: BorderSide(
                                            width: 2.0, color: AppColors.clr_bg_grey),
                                      ),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 50.0, right: 10.0, top: 10.0, bottom: 10.0),
                                    width: AppSizes.width * 0.44,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.clear,
                                          color: AppColors.clr_bg_black,
                                        ),
                                        SizedBox(
                                          width: AppSizes.width * 0.02,
                                        ),
                                        Text("Skip",
                                            style: TextStyle(
                                                color: AppColors.clr_bg_black,
                                                fontSize: 17)),
                                      ],
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    _alertDialogueContainer(context);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 50.0, right: 10.0, top: 10.0, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                              width: 2.0, color: AppColors.clr_bg_grey),
                                        ),
                                        color: Colors.white,
                                      ),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: AppColors.clr_green,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.02,
                                          ),
                                          Text("Accept",
                                              style: TextStyle(
                                                  color: AppColors.clr_green,
                                                  fontSize: 16)),
                                        ],
                                      )),
                                ),
                              ],
                            )),
                      ],
                    ));
              },
            )
    )
    );
  }

  Widget getInProgressContainer({@required BuildContext context, @required JobsInProgressResponse jobsInProgressResponse}) {
    return Container(
        child: Container(
            child: ListView.builder(
              itemCount: jobsInProgressResponse.data.length,
              itemBuilder: (context, index) {
                return Container(
                    width: AppSizes.width,
                    margin: EdgeInsets.only(top: AppSizes.width*0.03,left: AppSizes.width*0.05, right: AppSizes.width*0.05),
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
                        GestureDetector(
                          onTap: () {
                            _newTaskModalBottomSheet(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
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
                                          jobsInProgressResponse.data[index].name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Assets.muliSemiBold,
                                            color: AppColors.clr_bg_black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppSizes.height * 0.015,
                                        ),
                                        Text(
                                          jobsInProgressResponse.data[index].completedDate,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.clr_bg_grey,
                                          ),
                                        ),
                                        Text(
                                          getTime(jobsInProgressResponse
                                              .data[index].startDate) +
                                              " - " +
                                              getTime(jobsInProgressResponse
                                                  .data[index].completedDate),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.clr_bg_grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppSizes.height * 0.01,
                                        ),
                                        Container(
                                          width: AppSizes.width*0.65,
                                          child: Text(
                                            jobsInProgressResponse.data[index].description,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.clr_bg_grey,
                                            ),
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
                                        IconButton(
                                          onPressed: () {
                                            _newTaskModalBottomSheet(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "\$" + _getTotalAmount(jobsInProgressResponse.data[index].rate, jobsInProgressResponse.data[index].estimatedDuration),
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: Assets.muliSemiBold,
                                          ),
                                        ),
                                        Text(
                                          "\$" + jobsInProgressResponse.data[index].rate.toString() + "/h",
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
                        ),
                        Container(
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 2.0, color: AppColors.clr_bg_grey),
                                        right: BorderSide(
                                            width: 2.0, color: AppColors.clr_bg_grey),
                                      ),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.only(
                                        left: 50.0, right: 10.0, top: 10.0, bottom: 10.0),
                                    width: AppSizes.width * 0.44,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.clear,
                                          color: AppColors.clr_bg_black,
                                        ),
                                        SizedBox(
                                          width: AppSizes.width * 0.02,
                                        ),
                                        Text("Skip",
                                            style: TextStyle(
                                                color: AppColors.clr_bg_black,
                                                fontSize: 17)),
                                      ],
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    _alertDialogueContainer(context);
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 50.0, right: 10.0, top: 10.0, bottom: 10.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                              width: 2.0, color: AppColors.clr_bg_grey),
                                        ),
                                        color: Colors.white,
                                      ),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: AppColors.clr_green,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.02,
                                          ),
                                          Text("Accept",
                                              style: TextStyle(
                                                  color: AppColors.clr_green,
                                                  fontSize: 16)),
                                        ],
                                      )),
                                ),
                              ],
                            )),
                      ],
                    ));
              },
            )
        )
    );
  }
*/

  Widget getOffersContainer({@required BuildContext context,@required String jobTitle, @required String dateTime,@required String location,@required String totalAmount,@required String amountHour}) {
    return Column(children: [
      Expanded(
          child: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(
                left: AppSizes.width * 0.05,
                right: AppSizes.width * 0.05,
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.clr_field),
                  color: AppColors.clr_white),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jobTitle,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "MuliSemiBold",
                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.005),
                                Text(
                                  dateTime,
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.03),
                                Text(
                                  location,
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(

                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: AppColors.clr_bg_black2,
                                ),
                                SizedBox(height: AppSizes.height * 0.016),
                                Text(
                                  "\$" + totalAmount,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'MuliBold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$" + amountHour +"/h",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'MuliRegular',
                                      color: AppColors.clr_bg_black2),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.height * 0.02,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 2.0, color: AppColors.clr_field),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: AppSizes.height*0.06,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      width: 2.0, color: AppColors.clr_field),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(AppSizes.width * 0.02),
                              width: AppSizes.width * 0.44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.cancelgig,
                                    height: 20,
                                    width: 20,
                                    color: AppColors.clr_red,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.01,
                                  ),
                                  Text("Skip",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'MuliRegular',
                                        color: AppColors.clr_red,
                                      )),
                                ],
                              )),
                          GestureDetector(
                            onTap: () {
                              _newTaskModalBottomSheet(context);
                            },
                            child: Container(
                              height: AppSizes.height*0.06,
                                padding: EdgeInsets.all(AppSizes.width * 0.02),
                                decoration: BoxDecoration(),
                                width: AppSizes.width * 0.44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: AppColors.clr_green,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.01,
                                    ),
                                    Text("Accept",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.clr_green,
                                        )),
                                  ],
                                )),
                          ),
                        ],
                      )),
                ],
              )),
/*          SizedBox(
            height: AppSizes.height * 0.02,
          ),
          Container(
              margin: EdgeInsets.only(
                left: AppSizes.width * 0.05,
                right: AppSizes.width * 0.05,
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.clr_field),
                  color: AppColors.clr_white),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bartender",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "MuliSemiBold",
                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.005),
                                Text(
                                  "Wed,Sep 23",
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.03),
                                Text(
                                  "Crown Hotel New York",
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: AppColors.clr_bg_black2,
                                ),
                                SizedBox(height: AppSizes.height * 0.016),
                                Text(
                                  "\$140",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'MuliBold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$20/h",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'MuliRegular',
                                      color: AppColors.clr_bg_black2),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.height * 0.02,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 2.0, color: AppColors.clr_field),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: AppSizes.height*0.06,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      width: 2.0, color: AppColors.clr_field),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(AppSizes.width * 0.02),
                              width: AppSizes.width * 0.44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.cancelgig,
                                    height: 20,
                                    width: 20,
                                    color: AppColors.clr_red,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.01,
                                  ),
                                  Text("Skip",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'MuliRegular',
                                        color: AppColors.clr_red,
                                      )),
                                ],
                              )),
                          Container(
                              height: AppSizes.height*0.06,
                              padding: EdgeInsets.all(AppSizes.width * 0.02),
                              decoration: BoxDecoration(),
                              width: AppSizes.width * 0.44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: AppColors.clr_green,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.01,
                                  ),
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.clr_green,
                                      )),
                                ],
                              )),
                        ],
                      )),
                ],
              )),
          SizedBox(
            height: AppSizes.height * 0.02,
          ),
          _container(),
          SizedBox(
            height: AppSizes.height * 0.02,
          ),
          Container(
              margin: EdgeInsets.only(
                left: AppSizes.width * 0.05,
                right: AppSizes.width * 0.05,
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.clr_field),
                  color: AppColors.clr_white),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chef",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "MuliSemiBold",
                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.005),
                                Text(
                                  "Wed,Sep 23",
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.03),
                                Text(
                                  "Crown Hotel New York",
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: AppColors.clr_bg_black2,
                                ),
                                SizedBox(height: AppSizes.height * 0.016),
                                Text(
                                  "\$140",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'MuliBold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "\$20/h",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'MuliRegular',
                                      color: AppColors.clr_bg_black2),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.height * 0.02,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(width: 2.0, color: AppColors.clr_field),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: AppSizes.height*0.06,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      width: 2.0, color: AppColors.clr_field),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(AppSizes.width * 0.02),
                              width: AppSizes.width * 0.44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.cancelgig,
                                    height: 20,
                                    width: 20,
                                    color: AppColors.clr_red,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.01,
                                  ),
                                  Text("Skip",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'MuliRegular',
                                        color: AppColors.clr_red,
                                      )),
                                ],
                              )),
                          Container(
                              height: AppSizes.height*0.06,
                              padding: EdgeInsets.all(AppSizes.width * 0.02),
                              decoration: BoxDecoration(),
                              width: AppSizes.width * 0.44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: AppColors.clr_green,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: AppSizes.width * 0.01,
                                  ),
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.clr_green,
                                      )),
                                ],
                              )),
                        ],
                      )),
                ],
              )),

          SizedBox(
            height: AppSizes.height * 0.030,
          ),*/
        ],
      ))
    ]);
  }

  Widget getInProgressContainer({@required BuildContext context}) {
    return Column(children: [
      Expanded(
          child: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(
                left: AppSizes.width * 0.05,
                right: AppSizes.width * 0.05,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.clr_field),
                  color: AppColors.clr_white),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.width * 0.03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receptionist",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: "MuliSemiBold",
                                    color: AppColors.clr_bg_black,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.005),
                                Text(
                                  "Wed,Sep 23",
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                                SizedBox(height: AppSizes.height * 0.03),
                                Text(
                                  "Crown Hotel New York",
                                  style: TextStyle(
                                    fontFamily: 'MuliRegular',
                                    fontSize: 15,
                                    color: AppColors.clr_bg_black2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$140",
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'MuliBold',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$20/h",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MuliRegular',
                                  color: AppColors.clr_bg_black2),
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
                    padding: EdgeInsets.all( AppSizes.width*0.03),
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            width: 2.0,
                            color: AppColors.clr_field,
                          ),
                          bottom: BorderSide(
                              width: 2.0, color: AppColors.clr_field)),
                    ),
                    child: CommonWidgets.getAvailability2(
                      text1: "Check-in Time",
                      text: "10:02am",
                      onPress: () {},
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(AppSizes.height*0.03),
                    child: Text("04 : 22 : 53",style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'MuliBold'
                    ),),
                  ),

                ],
              )),

          SizedBox(
            height: AppSizes.height * 0.02,
          ),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                _requestBreakContainer(context: context);
              } ,
              child: Container(
                width: AppSizes.width,
                margin: EdgeInsets.only(left: AppSizes.width*0.05,right: AppSizes.width*0.05),
                decoration: BoxDecoration(
                  color: AppColors.clr_white,
                  border: Border.all(color: AppColors.clr_bg_black),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.all(AppSizes.height*0.020),
                child: Text("Request Break",style: TextStyle(
                    fontSize: 16,
                    color: AppColors.clr_bg_black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MuliRegular',
                ),
                textAlign: TextAlign.center,),
              ),
            ),
          ),

          SizedBox(
            height: AppSizes.height * 0.02,
          ),

          Align(
            alignment: Alignment.center,
            child: Container(
              width: AppSizes.width,
              margin: EdgeInsets.only(left: AppSizes.width*0.05,right: AppSizes.width*0.05),
              decoration: BoxDecoration(
                color: AppColors.clr_bg_black,
                border: Border.all(color: AppColors.clr_bg_black),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.all(AppSizes.height*0.020),
              child: Text("End Shift",style: TextStyle(
                fontSize: 16,
                color: AppColors.clr_white,
                fontFamily: 'MuliRegular',
              ),
                textAlign: TextAlign.center,),
            ),
          ),

        ],
      ))
    ]);
  }

  Widget getConfirmedContainer({@required BuildContext context,@required String jobTitle, @required String dateTime,@required String location,@required String totalAmount,@required String amountHour}) {
    return Column(children: [
      Expanded(
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    left: AppSizes.width * 0.05,
                    right: AppSizes.width * 0.05,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.clr_field),
                      color: AppColors.clr_white),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSizes.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Receptionist",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: "MuliSemiBold",
                                        color: AppColors.clr_bg_black,
                                      ),
                                    ),
                                    SizedBox(height: AppSizes.height * 0.005),
                                    Text(
                                      "Wed,Sep 23",
                                      style: TextStyle(
                                        fontFamily: 'MuliRegular',
                                        fontSize: 15,
                                        color: AppColors.clr_bg_black2,
                                      ),
                                    ),
                                    SizedBox(height: AppSizes.height * 0.03),
                                    Text(
                                      "Crown Hotel,New York",
                                      style: TextStyle(
                                        fontFamily: 'MuliRegular',
                                        fontSize: 15,
                                        color: AppColors.clr_bg_black2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: AppColors.clr_bg_black2,
                                    ),
                                    SizedBox(height: AppSizes.height * 0.01),
                                    Text(
                                      "\$140",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'MuliBold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\$20/h",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'MuliRegular',
                                          color: AppColors.clr_bg_black2),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      Container(
                          height: AppSizes.height*0.06,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 2.0, color: AppColors.clr_field),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: AppSizes.height*0.06,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 2.0, color: AppColors.clr_field),
                                    ),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(AppSizes.width * 0.02),
                                  width: AppSizes.width * 0.44,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.cancelgig,
                                        height: 20,
                                        width: 20,
                                        color: AppColors.clr_red,
                                      ),
                                      SizedBox(
                                        width: AppSizes.width * 0.01,
                                      ),
                                      Text("Cancel Gig",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_red,
                                          )),
                                    ],
                                  )),
                              GestureDetector(
                                onTap: () {
                                  _alertDialogueContainer(context);
                                },
                                child: Container(
                                    height: AppSizes.height*0.06,
                                    padding: EdgeInsets.all(AppSizes.width * 0.02),
                                    decoration: BoxDecoration(),
                                    width: AppSizes.width * 0.44,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.start_gig,
                                          height: 20,
                                          width: 20,
                                          color: AppColors.clr_bg_black,
                                        ),
                                        SizedBox(
                                          width: AppSizes.width * 0.01,
                                        ),
                                        Text("Start Gig",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.clr_bg_black,
                                            )),
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    ],
                  )),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: AppSizes.width * 0.05,
                    right: AppSizes.width * 0.05,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.clr_field),
                      color: AppColors.clr_white),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(AppSizes.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cleaner",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: "MuliSemiBold",
                                        color: AppColors.clr_bg_black,
                                      ),
                                    ),
                                    SizedBox(height: AppSizes.height * 0.005),
                                    Text(
                                      "Wed,Sep 23",
                                      style: TextStyle(
                                        fontFamily: 'MuliRegular',
                                        fontSize: 15,
                                        color: AppColors.clr_bg_black2,
                                      ),
                                    ),
                                    SizedBox(height: AppSizes.height * 0.03),
                                    Text(
                                      "Crown Hotel,New York",
                                      style: TextStyle(
                                        fontFamily: 'MuliRegular',
                                        fontSize: 15,
                                        color: AppColors.clr_bg_black2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: AppColors.clr_bg_black2,
                                    ),
                                    SizedBox(height: AppSizes.height * 0.01),
                                    Text(
                                      "\$140",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'MuliBold',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\$20/h",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'MuliRegular',
                                          color: AppColors.clr_bg_black2),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      Container(
                          height: AppSizes.height*0.06,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 2.0, color: AppColors.clr_field),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: AppSizes.height*0.06,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 2.0, color: AppColors.clr_field),
                                    ),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(AppSizes.width * 0.02),
                                  width: AppSizes.width * 0.44,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.cancelgig,
                                        height: 20,
                                        width: 20,
                                        color: AppColors.clr_red,
                                      ),
                                      SizedBox(
                                        width: AppSizes.width * 0.01,
                                      ),
                                      Text("Cancel Gig",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'MuliRegular',
                                            color: AppColors.clr_red,
                                          )),
                                    ],
                                  )),
                              GestureDetector(
                                onTap: () {
                                 // _newTaskModalBottomSheet(context);
                                },
                                child: Container(
                                    height: AppSizes.height*0.06,
                                    padding: EdgeInsets.all(AppSizes.width * 0.02),
                                    decoration: BoxDecoration(),
                                    width: AppSizes.width * 0.44,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.start_gig,
                                          height: 20,
                                          width: 20,
                                          color: AppColors.clr_bg_black,
                                        ),
                                        SizedBox(
                                          width: AppSizes.width * 0.01,
                                        ),
                                        Text("Start Gig",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.clr_bg_black,
                                            )),
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    ],
                  )),

            ],
          ))
    ]);
  }


  _newTaskModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(

              padding: EdgeInsets.only(
                  left: AppSizes.width * 0.015, right: AppSizes.width * 0.015),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              )),
              child: ListView(
                children: [
                  Container(
                      width: AppSizes.width * 0.08,
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Waiter",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'MuliBold',
                                          )),


                                    ],
                                  ),
                                 Row(children: [

                                   Container(
                                     alignment: Alignment.bottomLeft,
                                     child: Text("Crown Hotel",
                                         style: TextStyle(
                                           fontSize: 15,
                                           color: AppColors.clr_bg_black,
                                           fontFamily: 'MuliBold',
                                         )),
                                   ),
                                   SizedBox(
                                     width: AppSizes.width * 0.015,
                                   ),
                                   Container(
                                       padding: EdgeInsets.all(2.0),
                                       decoration: BoxDecoration(
                                           borderRadius:
                                           BorderRadius.circular(10.0),
                                           border: Border.all(
                                             color: AppColors.clr_bg_grey,
                                           )),
                                       child: Row(
                                         children: [
                                           Image.asset(Assets.star,
                                               width: 10, height: 10),
                                           Text("4.5",
                                               style: TextStyle(
                                                 fontSize: 12,
                                                 fontFamily:
                                                 Assets.muliRegular,
                                                 color:
                                                 AppColors.clr_bg_black,
                                               ))
                                         ],
                                       )),
                                 ],)
                                ],
                              )),
                              Container(
                                child: Image.asset(
                                  Assets.support,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Friday, 25 Sep",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Time",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10:00am - 5:00pm",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Pay",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$140 (\$20/h x 7 hours)",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.contacts,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Contact Person",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "John Doe",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(
                              5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Text(
                                      "Place",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Crown Hotel, New York, USA",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'MuliRegular',
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
                          Divider(),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                            height: AppSizes.height * 0.4,
                            width: AppSizes.width,
                            child: Image.asset(
                              Assets.google,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Divider(),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Instructions",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'MuliBold',
                                  color: AppColors.clr_bg_black,
                                ),
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.01,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Wear white shirt with black pants and black shoes.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.clr_bg_black,
                                  fontFamily: 'MuliRegular',
                                ),
                              )),
                          SizedBox(
                            height: AppSizes.height * 0.02,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_field,
                                  ),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: AppSizes.height*0.06,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              width: 2.0, color: AppColors.clr_field),
                                        ),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.all(AppSizes.width * 0.02),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Assets.cancelgig,
                                            height: 20,
                                            width: 20,
                                            color: AppColors.clr_bg_black,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.01,
                                          ),
                                          Text("Skip",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'MuliRegular',
                                                color: AppColors.clr_bg_black,
                                              )),
                                        ],
                                      )),
                                  Container(
                                      height: AppSizes.height*0.06,
                                      padding: EdgeInsets.all(AppSizes.width * 0.02),
                                      decoration: BoxDecoration(color: AppColors.clr_white),
                                      width: AppSizes.width * 0.44,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.check,
                                            color: AppColors.clr_green,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: AppSizes.width * 0.01,
                                          ),
                                          Text("Accept",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.clr_green,
                                              )),
                                        ],
                                      )),
                                ],
                              )),
                        ],
                      ))
                ],
              ));
        });
  }

  _alertDialogueContainer(BuildContext context) {
    return {
      {
        showDialog(
          context: context,
          builder: (context) {
            return Material(
              color: AppColors.clr_bg_black.withOpacity(0.5),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: AppSizes.width * 0.15,

                        ),
                        height: AppSizes.height*0.90,
                        color: AppColors.clr_bg,
                        child: ListView(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top:AppSizes.height*0.07),
                                child: Text("Robert",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "MuliBold"
                                  ),
                                  textAlign: TextAlign.center,)),
                            SizedBox(
                              height: AppSizes.height * 0.01,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                      5,
                                    ),
                                    child: Image.asset(
                                      Assets.star,
                                      height: 25,
                                      width: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(

                              margin: EdgeInsets.only(left:AppSizes.width*0.06,right:AppSizes.width*0.06,top: AppSizes.height*0.04,bottom: AppSizes.height*0.04),
                              child: Text("Add compliment",style: TextStyle(fontFamily: 'MuliBold',fontSize: 18),
                                textAlign: TextAlign.center,),
                            ),



                            Container(
                                width: AppSizes.width * 0.10,
                                height: AppSizes.height*0.07,

                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
                                padding: EdgeInsets.all(AppSizes.width*0.03),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_black,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Image.asset(
                                          Assets.greeting,
                                          height: 25,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: AppSizes.width * 0.03,
                                        ),
                                        Container(
                                            child: Text(
                                              "Greeting",
                                              style: TextStyle(
                                                fontFamily: "MuliBold",
                                                fontSize: 15,
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.check,size: 15,)
                                      ],
                                    )

                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height: AppSizes.height*0.07,

                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.venue_safety,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                          "Venue Safety",
                                          style: TextStyle(
                                            fontFamily: "MuliBold",
                                            fontSize: 15,
                                          ),
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.9,
                                height: AppSizes.height*0.07,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.work_atmosphere,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                          "Work Atmosphere",
                                          style: TextStyle(
                                            fontFamily: 'MuliBold',
                                            fontSize: 15,
                                          ),
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height: AppSizes.height*0.07,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.team_work,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                          "Team Work",
                                          style: TextStyle(
                                            fontFamily: 'MuliBold',
                                            fontSize: 15,
                                          ),
                                        )
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: AppSizes.height * 0.015,
                            ),
                            Container(
                                width: AppSizes.width * 0.12,
                                height: AppSizes.height*0.07,
                                margin: EdgeInsets.only(left:AppSizes.width*0.04,right:AppSizes.width*0.04),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.clr_bg_grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.management,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: AppSizes.width * 0.03,
                                    ),
                                    Container(
                                        child: Text(
                                          "Management",
                                          style: TextStyle(
                                            fontFamily: 'MuliBold',
                                            fontSize: 15,
                                          ),
                                        )
                                    ),
                                  ],
                                )
                            ),


                            SizedBox(
                              height: AppSizes.height * 0.03,
                            ),

                            CommonWidgets.getSignUpButton(context:context,text:"Submit Rating", onPress: (){hideLoader(context);}),

                            SizedBox(
                              height: AppSizes.height * 0.04,
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          left: AppSizes.width * 0.38,
                        ),
                        height: AppSizes.width * 0.25,
                        width: AppSizes.width * 0.25,

                        child: Image.asset(
                          Assets.support,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ),
            );
          },
        )
      },
    };
  }

  _container() {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: AppSizes.width * 0.05),
        child: Text(
          "Apply",
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'MuliBold',
            color: AppColors.clr_bg_black,
          ),
        ));
  }
  hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  _requestBreakContainer({context}){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(AppSizes.height*0.03),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Break Duration",
                      style: TextStyle(
                        fontSize: 22,
                          fontFamily: 'MuliSemiBold',
                          decoration: TextDecoration.none,
                          color: AppColors.clr_bg_black
                      ),),
                    Text("15 mins",
                      style: TextStyle(
                          fontFamily: 'MuliSemiBold',
                          decoration: TextDecoration.none,
                          color: AppColors.clr_bg_black2
                      ),)
                  ],
                ),
                SizedBox(height: AppSizes.height*0.075,),
                Container(
                  height: AppSizes.height*0.2,
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (dateTime) {
                      }
                  ),
                ),

                Expanded(child: CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Request Break"))
              ],
            ),
          );
        });

  }
}
