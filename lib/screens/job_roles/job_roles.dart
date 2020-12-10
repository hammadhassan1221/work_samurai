import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'job_roles_components.dart';

class JobRole extends StatefulWidget {
  @override
  _JobRoleState createState() => _JobRoleState();
}

class _JobRoleState extends State<JobRole> {
  JobRolesComponents _jobRolesComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobRolesComponents = JobRolesComponents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.getAppBar(text: "Job Roles", context: context),
            _jobRolesComponents.getHeading(text: "Worker Job Role"),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
            _jobRolesComponents.getJobRolesContainer(
                backgroundColor: AppColors.clr_white,
                borderColor: AppColors.transparentColor,
                textColor: AppColors.clr_bg_black,
                job: "Delivery Driver",
                verify: ""),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
            _jobRolesComponents.getVerifiedJobRolesContainer(
                backgroundColor: AppColors.clr_white,
                borderColor: AppColors.transparentColor,
                textColor: AppColors.clr_bg_black,
                job: "Waiter",
                verify: "Verified"),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
            _jobRolesComponents.getVerifiedJobRolesContainer(
                backgroundColor: AppColors.clr_white,
                borderColor: AppColors.transparentColor,
                textColor: AppColors.clr_bg_black,
                job: "Chef",
                verify: "Verified"),
            Expanded(
              child: CommonWidgets.getSignUpButton(
                  context: context, onPress: () {}, text: "Add a Role"),
            ),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
          ],
        ),
      ),
    ));
  }
}
