import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:work_samurai/screens/worker/pages/gigs/gigs_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/confirmed/confirmed_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/confirmed/confirmed_provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';

class ConfirmedJob extends StatefulWidget {
  @override
  _ConfirmedJobState createState() => _ConfirmedJobState();
}

class _ConfirmedJobState extends State<ConfirmedJob> {
  ConfirmedComponent _component;

  // // OffersProvider _provider;
  // ScrollController _controller;
  int pageNumber = 0;
  FutureJobsResponse futureJobsResponse = FutureJobsResponse.empty();
  List<Data> _futureJobsList = List<Data>();
  Dio _dio = Dio();
  int pageCount = 10;
  static const _pageSize = 50;
  int currentPage = 0;

  final PagingController<int, Data> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _component = ConfirmedComponent();
    _pagingController.addPageRequestListener(
          (pageKey) async {
        await getFutureJobs(
          jobType: 3,
          pageSize: Constants.pageSize,
          pageNumber: pageNumber,
        );
      },
    );
  }
  @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalValue(
            12.0,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(
                    () => _pagingController.refresh(),
              ),
          child: PagedListView<int, Data>.separated(
            pagingController: _pagingController,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) =>
                verticalSpacer(
                  16.0,
                ),
            builderDelegate: PagedChildBuilderDelegate<Data>(
              itemBuilder: (context, item, index) =>
                GigsComponents().getConfirmedContainer(
                      context: context,
                      jobTitle: item.name,
                      dateTime: item.startDate,
                      location: item.distance.toString(),
                      totalAmount: item.rate.toString(),
                      amountHour: "0",
                      onLeave: (){
                        ConfirmedProvider().leaveForJob(context, item.iD);
                      },
                      onReject: (){
                        ConfirmedProvider().rejectJob(context, item.iD);
                      },
                      onStart: (){
                        ConfirmedProvider().startJob(context, item.iD);
                      },
                      leftForJob: item.leftForJob
                ),
            ),
          ),
        ),
      );
    }


  Future getFutureJobs({int jobType, int pageSize, int pageNumber}) async {
    try {
      String token =
          "Bearer " + PreferenceUtils.getString(Strings.ACCESS_TOKEN);
      debugPrint('Token: $token');
      var formData = new Map<String, dynamic>();
      formData['JobType'] = jobType;
      formData['PageSize'] = pageSize;
      formData['PageNumber'] = pageNumber;

      _dio.options.contentType = Headers.formUrlEncodedContentType;
      Response _response = await _dio.post(
        getJobByType,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": token,
            "DeviceID": "Device Id goes here",
          },
        ),
      );
      if (_response.statusCode != 200) {}
      if (_response.statusCode == 200) {
        if (futureJobsResponse.data.length <= _pageSize) {
          FutureJobsResponse temp = FutureJobsResponse.empty();
          temp = FutureJobsResponse.fromJson(_response.data);
          pageCount = pageCount + temp.data.length;
          futureJobsResponse.data.addAll(temp.data);
          _futureJobsList.addAll(futureJobsResponse.data);
          final isLastPage = temp.data.length < _pageSize;
          if (isLastPage)
            _pagingController.appendLastPage(_futureJobsList);
          else {
            final nextPage = pageNumber + 1;
            _pagingController.appendPage(_futureJobsList, nextPage);
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}