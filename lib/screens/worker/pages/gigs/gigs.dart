import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Gigs extends StatefulWidget {

  final FutureJobsResponse jobsResponse;

  Gigs({@required this.jobsResponse});
  @override
  _GigsState createState() => _GigsState();
}

class _GigsState extends State<Gigs> with SingleTickerProviderStateMixin{
  TabController _tabController;
  GigsComponents _gigsComponents;
  GigsProvider gigsProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gigsComponents = GigsComponents();
    gigsProvider = Provider.of<GigsProvider>(context, listen: false);
    Future.delayed(Duration.zero, (){
      gigsProvider.init(context: context);
    });
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if(_tabController.index == 1){
        gigsProvider.setInProgress(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GigsProvider>(context, listen: true);
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child: Column(children: [
        CommonWidgets.getAppBarWithout(text: "Gigs"),
        Container(
          alignment: Alignment.center,
          width: AppSizes.width,
          color: AppColors.clr_white,
          child: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontFamily:'MuliSemiBold'),
            indicatorColor: AppColors.clr_bg_grey,
            labelColor: AppColors.clr_bg_black,
            unselectedLabelColor: AppColors.clr_bg_grey,
            indicator: BoxDecoration(
                color: AppColors.clr_white,
                border: Border(
                    bottom: BorderSide(
                      color: AppColors.clr_bg_black,
                      width: 3.0,
                    ))),
            isScrollable: true,
            tabs: <Widget>[
              _tabBar("Offers"),
              _tabBar("In-Progress"),
              _tabBar("Confirmed"),
            ],
          ),
        ),
        SizedBox(
          height: AppSizes.height*0.01,
        ),
        Container(
          child: Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                gigsProvider.getFutureJobFetched() ? _gigsComponents.getOffersContainer(context: context, futureJobsResponse: gigsProvider.getFutureJobResponse()) : Container(
                  child: Column(
                    children: [
                      Container(
                        height: AppSizes.height*0.05,
                        width: AppSizes.width*0.05,
                        margin: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
                gigsProvider.getFetchJobInProgress() ? _gigsComponents.getInProgressContainer(context: context, jobsInProgressResponse: gigsProvider.getJobsInProgressResponse()):Container(
                  child: Column(
                    children: [
                      Container(
                        height: AppSizes.height*0.05,
                        width: AppSizes.width*0.05,
                        margin: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
                _gigsComponents.getConfirmedContainer(),
              ],
            ),
          ),
        )
      ]),
    );
  }
  _tabBar(String tabName) {
    return Container(
      width: AppSizes.width * 0.21,
      child: Tab(
        text: tabName,

      ),
    );
  }
}
