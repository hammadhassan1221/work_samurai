import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/constants/constants.dart';
import 'package:work_samurai/models/api_models/worker_screen/gigs_screen/future_jobs_response.dart';
import 'package:work_samurai/network/gigs/gigs_api_end_points.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/widgets/spacer.dart';
import 'package:work_samurai/screens/worker/pages/gigs/offers/offers_components.dart';
import 'package:work_samurai/screens/worker/pages/gigs/offers/offers_provider.dart';

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  OffersComponent _component;
  OffersProvider _provider;
  ScrollController _controller;
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
    _provider = Provider.of<OffersProvider>(context, listen: false);
    _component = OffersComponent();
    _controller = ScrollController();
    Future.delayed(Duration.zero, () {
      _provider.initialize(context: context);
    });
    _pagingController.addPageRequestListener(
      (pageKey) async {
        await getFutureJobs(
          jobType: 0,
          pageSize: Constants.pageSize,
          pageNumber: pageNumber,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<OffersProvider>(context, listen: true);
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
              context: this.context,
              jobTitle: item.name,
              dateTime: item.startDate,
              location: item.name,
              totalAmount: item.rate,
              amountHour: item.rate,
              acceptJob: () async {
                bool response = await _provider.acceptJob(
                    context: this.context, jobId: item.iD);
                if(response){
                  _pagingController.refresh();
                }

                //_component.alertDialogueContainer(context);
              },
              rejectJob: () async {
                bool respons = await _provider.rejectJob(
                  context: context,
                  jobId: item.iD,
                );
                if(respons){
                  _pagingController.refresh();
                }
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
