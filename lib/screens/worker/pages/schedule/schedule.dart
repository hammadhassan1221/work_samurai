import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/location_details/location_details.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_components.dart';
import 'package:work_samurai/screens/worker/pages/schedule/schedule_provider.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  double _value = 0.0;
  ScheduleComponents _scheduleComponents;
  ScheduleProviders _scheduleProviders;
  WorkerProvider _workerProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scheduleComponents = ScheduleComponents();
    _scheduleProviders = Provider.of<ScheduleProviders>(context, listen:false);
    _workerProvider = Provider.of<WorkerProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ScheduleProviders>(context, listen:true);
    Provider.of<WorkerProvider>(context,listen: true);
    return Container(
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child: Column(children: [
        CommonWidgets.getAppBarWithout(text: "Your Schedule"),

        CommonWidgets.getAlertContainer(onPress: (){_workerProvider.setCurrentIndex(4);}),

        SizedBox(
          height: AppSizes.height * 0.025,
        ),

        Expanded(
          child: ListView(
            children: [
              _scheduleComponents.getLocation(imagePath: Assets.location, text: "Location", text1: "New York,USA",onPress: (){Navigator.push(context, SlideRightRoute(page: LocationDetails()));}),

              Container(
                margin: EdgeInsets.only(
                  top: AppSizes.height*0.01,
                  left: AppSizes.width*0.03,right: AppSizes.width*0.03,),
                height:AppSizes.height*0.0025,
                width: AppSizes.width,
                color: AppColors.clr_field
                ,),
              SizedBox(height: AppSizes.height*0.02,),

              _scheduleComponents.getDistance(imagePath: Assets.distance, text: "Max Distance", text1: "40km"),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.clr_bg_black,
                  inactiveTrackColor: AppColors.clr_field,
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 2.0,
                  thumbColor: AppColors.clr_bg_black,
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 6.0),
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
              Container(
                margin: EdgeInsets.only(
                  top: AppSizes.height*0.01,
                  left: AppSizes.width*0.03,right: AppSizes.width*0.03,),
                height:AppSizes.height*0.0025,
                width: AppSizes.width,
                color: AppColors.clr_field
                ,),
              SizedBox(height: AppSizes.height*0.02,),

              _scheduleComponents.getDayTime(day: "Mon", time: "10:00 am - 5:00pm",buildContext: context, scheduleProviders: _scheduleProviders),
              SizedBox(
                height: AppSizes.height * 0.02,
              ),
              _scheduleComponents.getDayTime(day: "Tues", time: "10:00 am - 5:00pm",buildContext: context, scheduleProviders: _scheduleProviders),
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

              SizedBox(
                height: AppSizes.height * 0.02,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
