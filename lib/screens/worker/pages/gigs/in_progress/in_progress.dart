import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/screens/worker/pages/gigs/in_progress/in_progress_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/in_progress/in_progress_provider.dart';
import 'package:work_samurai/screens/worker/pages/gigs/offers/offers_provider.dart';
import 'package:work_samurai/widgets/spacer.dart';

class InProgressPage extends StatefulWidget {
  @override
  _InProgressPageState createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  InProgressProvider _provider;
  InProgressComponents _components;
  OffersProvider _offersProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _provider = Provider.of<InProgressProvider>(context, listen: false);
    _offersProvider = Provider.of<OffersProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      _provider.init(context: context);
    });
    _components = InProgressComponents();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<InProgressProvider>(context, listen: true);
    return Column(
      children: [
        Expanded(
          child: _components.inProgressContainer(
            context: context,
            jobTitle: "Bartender",
            dateTime: "23 Nov, 2020",
            location: "Crown Hotel, New York",
            totalAmount: "350",
            amountHour: "25",
            requestBreak: () {
              _components.requestBreakContainer(
                context: context,
                requestBreak: (minutes) async {
                  Navigator.pop(context);
                  await _provider.requestBreak(
                    context: context,
                    duration: minutes,
                  );
                },
              );
            },
            endShift: () async {
              final response = await _provider.endBreak(context: this.context);
            },
          ),
        ),
      ],
    );
  }
}
