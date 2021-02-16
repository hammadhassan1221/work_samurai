import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/screens/worker/pages/gigs/Pending/PendingComponent.dart';
class PendingJobs extends StatefulWidget {
  @override
  _PendingJobsState createState() => _PendingJobsState();
}

class _PendingJobsState extends State<PendingJobs> {
  PendingComponent _component;
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
    _component = PendingComponent();
    _pagingController.addPageRequestListener(
          (pageKey) async {
        await getFutureJobs(
          jobType: 4,
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
        onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
        ),
        child: PagedListView<int, Data>.separated(
          pagingController: _pagingController,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => verticalSpacer(
            16.0,
          ),
          builderDelegate: PagedChildBuilderDelegate<Data>(
            itemBuilder: (context, item, index) =>
                _component.getSingleContainer(
                  context: context,
                  jobTitle: item.name,
                  dateTime: item.startDate,
                  location: item.name,
                  totalAmount: item.rate,
                  amountHour: item.rate,
                  acceptJob: () async {
                  },
                  rejectJob: () async {
                  },
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
