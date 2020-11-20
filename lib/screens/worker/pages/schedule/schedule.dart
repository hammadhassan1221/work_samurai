import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_components.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  double _value = 0.0;
  ScheduleComponents _scheduleComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scheduleComponents = ScheduleComponents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child: Column(children: [
        CommonWidgets.getAppBarWithout(text: "Your Schedule"),
        SizedBox(
          height: AppSizes.height * 0.02,
        ),


        Expanded(
          child: ListView(
            children: [

              _scheduleComponents.getLocationDistance(imagePath: Assets.location, text: "Location", text1: "New York,USA"),
              Divider(),
              _scheduleComponents.getLocationDistance(imagePath: Assets.distance, text: "Distance", text1: "40km"),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.clr_bg_black,
                  inactiveTrackColor: AppColors.clr_bg_grey,
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: AppColors.clr_bg_black,
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 6.0),
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 28.0),
                ),

                child: Container(
                  width: AppSizes.width,
                  child: Slider(
                    value: _value,
                    max: 4,
                    min: 0,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
              ),

              _scheduleComponents.getDayTime(day: "Mon", time: "10:00 am - 5:00pm"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getDayTime(day: "Tues", time: "10:00 am - 5:00pm"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getWedThur(day: "Wed", time: "10:00 am - 5:00pm"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getWedThur(day: "Thur", time: "10:00 am - 5:00pm"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getDayTime(day: "Fri", time: "10:00 am - 5:00pm"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getDayTime(day: "Sat", time: "Available All Day"),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getDayTime(day: "Sun", time: "Available All Day"),
            ],
          ),
        )
      ]),
    );
  }
}
