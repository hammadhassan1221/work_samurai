import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/screens/worker/pages/gigs/in_progress/in_progress_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/in_progress/in_progress_provider.dart';
import 'package:work_samurai/widgets/toast.dart';

class InProgressPage extends StatefulWidget {
  @override
  _InProgressPageState createState() => _InProgressPageState();
}

class _InProgressPageState extends State<InProgressPage> {
  InProgressProvider _provider;
  InProgressComponents _components;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _provider = Provider.of<InProgressProvider>(context, listen: false);
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
          child: _provider.inProgressData
              ? _components.inProgressContainer(
                  context: context,
                  jobTitle: _provider.inProgressResponse.data.name,
                  dateTime: _provider.inProgressResponse.data.startDate,
                  location: _provider.inProgressResponse.data.description,
                  totalAmount:
                      _provider.inProgressResponse.data.rate.toString() ?? "",
                  timer: _provider.inProgressResponse.data.estimatedDuration ??
                      0.0,
                  amountHour:
                      _provider.inProgressResponse.data.rate.toString() ?? "",
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
                    final response =
                        await _provider.endBreak(context: this.context);
                  },
                  startTime: _provider.inProgressResponse.data.estimatedDuration
                      .toInt() *60,
                  onTimeFinish: () {
                    ApplicationToast.getErrorToast(
                      durationTime: 3,
                      heading: "",
                      subHeading: "Your Time has been exceeded",
                    );
                  },
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
