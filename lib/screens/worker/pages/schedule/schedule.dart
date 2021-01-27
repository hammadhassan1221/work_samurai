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
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  double _value = 1.0;
  ScheduleComponents _scheduleComponents;
  ScheduleProviders _scheduleProviders;
  WorkerProvider _workerProvider;
  String _apiKey = "AIzaSyCn30TymjA7mf96UR4eNg9LN6NnsY-v92Q";
  String locationText = "Select address";
  GoogleMapsPlaces _places = GoogleMapsPlaces();
  double gpsLat, gpsLong;
  String addressLine,city,state,country;
  int postalCode;

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);
      gpsLat = detail.result.geometry.location.lat;
      gpsLong = detail.result.geometry.location.lng;
      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      this.addressLine = address.first.addressLine ?? "";
      this.city = address.first.locality ?? "";
      this.state = address.first.adminArea ?? "";
      this.country = address.first.countryName ?? "";
      this.postalCode = address.first.postalCode == null ? 0 : int.parse(address.first.postalCode) ;
      setState(() {
        this.locationText = address.first.locality == null ? address.first.countryName :address.first.locality+", " + address.first.countryName;
      });
    } else {
      print("prediction is null");
    }
  }
  @override
  void initState() {
    super.initState();
    _places = GoogleMapsPlaces(apiKey: _apiKey);
    _scheduleComponents = ScheduleComponents();
    _scheduleProviders = Provider.of<ScheduleProviders>(context, listen:false);
    _workerProvider = Provider.of<WorkerProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
       Map<String,dynamic> map = await _scheduleProviders.getCurrentPreferences(context);
       Map<String,dynamic> locationData = await _scheduleProviders.getCurrentAddress(context);
       setState(() {
         _value = getDistanceText(map) < 51 && getDistanceText(map) > 0 ? getDistanceText(map) : 0 ;
         this.addressLine ??= locationData["AddressLine"] ;
         this.city ??= locationData["City"] ;
         this.state ??= locationData["State"] ;
         this.postalCode ??= locationData["Postcode"] ;
         this.country ??= locationData["Country"] ;
         this.gpsLat ??= locationData["GPSLat"] ;
         this.gpsLong ??= locationData["GPSLong"] ;
         this.locationText = city + ", "+ country;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ScheduleProviders>(context, listen:true);
    Provider.of<WorkerProvider>(context,listen: true);
    _scheduleComponents.addListener((){setState((){});});
    return FutureBuilder(
        future: ScheduleProviders().getCurrentPreferences(context),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            ///Preferences loaded
            ScheduleComponents.scheduleMap = snapshot.data;
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
                      _scheduleComponents.getLocation(imagePath: Assets.location, text: "Location", text1: locationText,onPress: () async{
                        Prediction p = await PlacesAutocomplete.show(
                            context: context, apiKey: _apiKey);
                        displayPrediction(p);
                      }),
                      Container(
                        margin: EdgeInsets.only(
                          top: AppSizes.height*0.01,
                          left: AppSizes.width*0.03,right: AppSizes.width*0.03,),
                        height:AppSizes.height*0.0025,
                        width: AppSizes.width,
                        color: AppColors.clr_field
                        ,),
                      SizedBox(height: AppSizes.height*0.02,),

                      _scheduleComponents.getDistance(imagePath: Assets.distance, text: "Max Distance", text1: _value.ceil().toString()+" km"),

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
                            max: 50.0,
                            min: 0.0,
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
                      _scheduleComponents.getDayTime(day: "Mon", time: getScheduleText(snapshot.data, "Monday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _scheduleComponents.getDayTime(day: "Tue", time: getScheduleText(snapshot.data, "Tuesday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _scheduleComponents.getDayTime(day: "Wed", time: getScheduleText(snapshot.data, "Wednesday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _scheduleComponents.getDayTime(day: "Thu", time:getScheduleText(snapshot.data, "Thursday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _scheduleComponents.getDayTime(day: "Fri", time: getScheduleText(snapshot.data, "Friday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _scheduleComponents.getDayTime(day: "Sat", time: getScheduleText(snapshot.data, "Saturday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                      _scheduleComponents.getDayTime(day: "Sun", time: getScheduleText(snapshot.data, "Sunday"),buildContext: context, scheduleProviders: _scheduleProviders),
                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),

                      CommonWidgets.getBottomButton(name: "Save schedule",onButtonClick: ((){
                        if(ScheduleComponents.scheduleMap.length >= 14){
                          //all days selected
                          // ApplicationToast.getSuccessToast(durationTime: 3, heading: "null", subHeading: ScheduleComponents.scheduleMap.length.toString());
                          ScheduleComponents.scheduleMap["JobRadius"] = _value.ceil().toString();
                          _scheduleProviders.sendShedule(ScheduleComponents.scheduleMap,context);
                        }
                        else{
                          // ApplicationToast.getErrorToast(durationTime: 3, heading: "Error", subHeading: "Please select time for all days");
                        }
                        Map<String, dynamic> locationData = Map<String, dynamic>();

                        locationData["AddressLine"] = this.addressLine;
                        locationData["City"] = this.city;
                        locationData["State"] = this.state;
                        locationData["Postcode"] = this.postalCode;
                        locationData["Country"] = this.country;
                        locationData["GPSLat"] = this.gpsLat ;
                        locationData["GPSLong"] = this.gpsLong;

                        _scheduleProviders.sendLocation(locationData, context);
                      })),

                      SizedBox(
                        height: AppSizes.height * 0.02,
                      ),
                    ],
                  ),
                )
              ]),
            );
          }
          else{
            //Not loaded yet
            return Material(
              color: AppColors.clr_bg_grey.withOpacity(0.4),
              child: Center(
                child: Container(
                  height: AppSizes.height * 0.20,
                  width: AppSizes.width * 0.30,
                  child: Lottie.asset(Assets.loader),
                ),
              ),
            );;
          }
        }
    );

  }

  String getScheduleText(Map<String,dynamic> map,String day) => (map["${day}From"] == null && map["${day}To"] == null) ? "Select Time" : map["${day}From"] + " - " + map["${day}To"];
  double getDistanceText(Map<String,dynamic> map) => map["JobRadius"] == null ? 1.0 : double.parse(map["JobRadius"].toString());
}
