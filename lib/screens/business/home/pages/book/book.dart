import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/business/home/pages/book/book_components.dart';
import 'package:work_samurai/screens/business/home/pages/messages_chat/messages.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  BookComponents _bookComponents;
  bool isEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bookComponents = BookComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: AppSizes.height,
          width: AppSizes.width,
          margin: EdgeInsets.all(15),
          // margin: EdgeInsets.only(left: AppSizes.width*0.06,right:AppSizes.width*0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: AppSizes.height * 0.02),
                child: Text(
                  "Book Your Samurai",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'MuliBold',
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _bookComponents.getInfoContainer(
                        Heading: "Location",
                        Subheading: "Crown Hotel, New York"),
                    _bookComponents.getDropDownContainer(
                        heading: "Category of Worker",
                        subheading: "Hospiatality",
                        imagepath: null),
                    _bookComponents.getDropDownContainer(
                        heading: "Position Needed",
                        subheading: "Waiter",
                        imagepath: null),
                    _bookComponents.getInfoContainer(
                        Heading: "Number of Workers", Subheading: "2"),
                    _bookComponents.getDescription(heading: "Job Description"),
                    _bookComponents.getSimpleContainer(heading: "Hourly rate"),
                    _bookComponents.getDateContainer(
                        date: "Date", imagepath: null),
                    _bookComponents.getSimpleContainer(heading: "Time"),
                    _bookComponents.getSimpleContainer(heading: "No. of hours"),
                    _bookComponents.getAmountContainer(
                        text: "Total amount", total: "\$35"),
                    CommonWidgets.getRow(
                        "Automatically Select Worker For me", isEnabled,
                        ((bool value) {
                      setState(() {
                        isEnabled = !isEnabled;
                      });
                    })),
                    CommonWidgets.getButton(
                        backgroundColor: AppColors.clr_bg_black,
                        borderColor: AppColors.transparentColor,
                        textColor: AppColors.clr_white,
                        text: 'Confirm',
                        onPress: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
