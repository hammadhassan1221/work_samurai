// import 'package:flutter/material.dart';
// import 'package:work_samurai/models/api_models/in_progress/in_progress.dart';
// import 'package:work_samurai/screens/worker/pages/gigs/confirmed/confirmed_provider.dart';
// import 'package:work_samurai/screens/worker/pages/gigs/gigs_components.dart';
//
// class ConfirmedJob extends StatefulWidget {
//   @override
//   _ConfirmedJobState createState() => _ConfirmedJobState();
// }
//
// class _ConfirmedJobState extends State<ConfirmedJob> {
//   GigsComponents _gigsComponents = GigsComponents();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: ConfirmedProvider().getConfirmedJobs(context),
//         builder: ((context, AsyncSnapshot<InProgressResponse> snapshot){
//           Data job = snapshot.data.data;
//          _gigsComponents.getConfirmedContainer(context: context, jobTitle: job.name.toString(), dateTime: job.startDate, location: job., totalAmount: null, amountHour: null)
//         }));
//   }
// }
