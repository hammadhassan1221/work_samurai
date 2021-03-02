import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts_components.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  AlertsComponents _alertsComponents;
  AlertProviders _alertProviders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _alertsComponents = AlertsComponents();
    _alertProviders = Provider.of<AlertProviders>(context, listen: false);
    _alertProviders.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AlertProviders>(context, listen: true);
    return Container(
      width: AppSizes.width,
      color: Colors.grey[100],
      child: Column(
        children: [
          CommonWidgets.getAppBarWithout(text: "Alerts"),
          SizedBox(height: AppSizes.height * 0.01),
          _alertsComponents.time("February"),
          _alertProviders.getIsDataFetched() == true
              ? Expanded(
                  child: _alertProviders.getAlerts().data.length >= 0
                      ? ListView.builder(
                    padding: EdgeInsets.only(top: 10, left: 10),
                          itemCount: 3/*_alertProviders.getAlerts().data.length3*/,
                          itemBuilder: (context, index) {
                            return _alertsComponents.getNotificationsContainer(
                                leftIcon: Assets.support,
                                userName:"CrownStar left a 5 star Review", //_alertProviders.getAlerts().data[index].title,
                                message:"yesterday",//_alertProviders.getAlerts().data[index].body,
                                time:"",); //_alertProviders.getAlerts().data[index].createdDate);
                          })
                      : CommonWidgets.onNullData(text: "No Alerts"))
              : Container()
        ],
      ),
    );
  }
}
