import 'package:flutter/cupertino.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts_components.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {

  AlertsComponents _alertsComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _alertsComponents = AlertsComponents();
  }
  @override
  Widget build(BuildContext context) {
    return _alertsComponents.getAlerts();

  }
}
