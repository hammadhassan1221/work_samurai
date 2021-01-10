import 'package:flutter/cupertino.dart';
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
      color: AppColors.clr_bg,
      child: Column(
        children: [
          CommonWidgets.getAppBarWithout(text: "Alerts"),
          SizedBox(height: AppSizes.height * 0.01),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
                itemBuilder: (context, index){
              return _alertsComponents.getNotificationsContainer(
                  leftIcon: Assets.support,
                  userName: "Rizwan",
                  message: "Your Delivey Is successfully done.",
                  time: "5:30");
            }),
          )
        ],
      ),
    );

  }
}
