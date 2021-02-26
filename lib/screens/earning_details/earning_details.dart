import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/models/api_models/earning_screen/earning_response_model.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/earning_history/earning_history.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'earning_details_components.dart';

class EarningsDetails extends StatefulWidget {

  @override
  EarningResponseModel earningObj;
  EarningsDetails({@required this.earningObj});
  _EarningsDetailsState createState() => _EarningsDetailsState();
}

class _EarningsDetailsState extends State<EarningsDetails> {


  String price = "20";
  String time = "0";

  EarningDetailsComponents _earningDetailsComponents;
  @override
  void initState() {
    print(widget.earningObj);
    // TODO: implement initState
    super.initState();
    _earningDetailsComponents = EarningDetailsComponents();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.clr_bg,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonWidgets.getAppBarAccount(text: "Earning Detail", context: context),


            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.earningObj.data.jobs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 12
                  ),
                 // margin: EdgeInsets.only(left:AppSizes.width*0.05,right:AppSizes.width*0.05, top:AppSizes.width*0.05),
                  padding: EdgeInsets.all(AppSizes.width*0.03),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.earningObj.data.jobs[index].description,
                        style: TextStyle(
                            fontFamily: "MuliSemiBold",
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: AppSizes.width * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10,),
                          Text(
                            "\$" + widget.earningObj.data.jobs[index].rate.toString() ,
                            style: TextStyle(
                              color: Colors.black,
                                fontFamily: "MuliSemiBold",
                                fontSize: 18,
                                fontWeight: FontWeight.w300,

                                decoration: TextDecoration.none),
                          ),
                          SizedBox(width: 5,),
                          Text(
                             "for" ,
                            style: TextStyle(
                                color:Colors.black,
                                fontWeight: FontWeight.w300,

                                fontFamily: "MuliSemiBold",
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(width: 5,),
                          Text(
                             "$time " + widget.earningObj.data.jobs[index].estimatedDuration.toString() ,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontFamily: "MuliSemiBold",
                                fontSize: 18,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.grey,
                  width: AppSizes.width,

                );
              },
            ),

            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 20),
            //   alignment: Alignment.bottomCenter,
            //     child: CommonWidgets.getBottomButton(name: "Download Payslip"))
          ],
        ),
      ),
    );
  }
}
