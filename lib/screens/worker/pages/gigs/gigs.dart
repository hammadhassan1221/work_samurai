import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/edit_profile/edit_profile.dart';
import 'package:work_samurai/screens/worker/pages/alerts/alerts.dart';
import 'package:work_samurai/screens/worker/pages/gigs/confirmed/confirmed_provider.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_provider.dart';
import 'package:work_samurai/screens/worker/pages/gigs/offers/offers_page.dart';
import 'package:work_samurai/screens/worker/worker_provider.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/widgets/toast.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'in_progress/in_progress.dart';

class Gigs extends StatefulWidget {

  @override
  _GigsState createState() => _GigsState();
}

class _GigsState extends State<Gigs> with SingleTickerProviderStateMixin {
  TabController _tabController;
  GigsComponents _gigsComponents;
  GigsProvider gigsProvider;
  WorkerProvider _workerProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gigsComponents = GigsComponents();
    gigsProvider = Provider.of<GigsProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      gigsProvider.init(context: context);
    });
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        gigsProvider.setInProgress(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GigsProvider>(context, listen: true);
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonWidgets.getGigsAppBar(text: "Gigs"),
          TabBar(
            labelStyle: TextStyle(fontFamily: 'MuliSemiBold'),
            indicatorColor: AppColors.clr_bg_grey,
            labelColor: AppColors.clr_bg_black,
            unselectedLabelColor: AppColors.clr_bg_black3,
            tabs: <Widget>[
              _tabBar("Offers"),
              _tabBar("Confirmed"),
              _tabBar("In-Progress"),
            ],
          ),
          _gigsComponents.isAccountVerified(context: context),
          verticalSpacer(16.0,),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                OffersPage(),
                _gigsComponents.getConfirmedContainer(
                  context: context,
                  jobTitle: "Receptionist",
                  dateTime: "23 Nov, 2020",
                  location: "Crown Hotel, New York",
                  totalAmount: "240",
                  amountHour: "20",
                  onLeave: (){
                    ConfirmedProvider().leaveForJob(context, 1021);
                  }
                ),
                InProgressPage(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _tabBar(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
