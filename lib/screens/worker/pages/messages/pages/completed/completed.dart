import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/animations/slide_right.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/chat/chat_screen.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/archive/archive_components.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/archive/archive_providers.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/completed/complete_components.dart';
import 'package:work_samurai/screens/worker/pages/messages/pages/completed/complete_providers.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Completed extends StatefulWidget {
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  CompleteComponents _completeComponents;
  CompleteProviders _completeProviders;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _completeComponents = CompleteComponents();
    _completeProviders = Provider.of<CompleteProviders>(context,listen:false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ArchiveProviders>(context,listen:true);
    return Container(
      height: AppSizes.height,
      width: AppSizes.width,
      color: AppColors.clr_bg,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CommonWidgets.getAppBarWithout(text: "Messages",),

            CommonWidgets.getAlertContainer(onPress: (){}),

            SizedBox(
              height: AppSizes.height * 0.02,
            ),

            CommonWidgets.getSupportContainer(imagePath: Assets.support,heading: "Work Samurai Support",onPress: (){}),

            SizedBox(
              height: AppSizes.height * 0.02,
            ),

            _completeComponents.getMessageThread(onPress: (){Navigator.push(context, SlideRightRoute(page:ChatScreen()));}, imagePath: Assets.oval, heading: "Crown Hotel", subHeading: "Waiter, Wed, Sep 23" , imagePath1: Assets.star, rating: "4.5"),



          ]),
    );  }
}
