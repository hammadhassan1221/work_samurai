import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/commons/utils.dart';
import 'package:work_samurai/generic_decode_encode/generic.dart';
import 'package:work_samurai/models/get_data/UserWholeData.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/res/strings.dart';
import 'package:work_samurai/screens/support/support_components.dart';
import 'package:work_samurai/screens/support/support_providers.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {

  SupportComponents _supportComponents;
  SupportProviders _supportProviders;
  TextEditingController _supportTitle;
  UserWholeData _userWholeData;
  GenericDecodeEncode _genericDecodeEncode = GenericDecodeEncode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _supportComponents = SupportComponents();
    _supportProviders = Provider.of<SupportProviders>(context, listen:false);
    _supportProviders.init(context: context,);

    String userDataFromPrefs = PreferenceUtils.getString(Strings.USER_DATA);
    if (userDataFromPrefs.isNotEmpty) {
      _userWholeData = UserWholeData.fromJson(
          _genericDecodeEncode.decodeJson(userDataFromPrefs));
    }
    _supportTitle = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SupportProviders>(context, listen:true);
    return SafeArea(
        child: Scaffold(
            body: Container(
              height: AppSizes.height,
              width: AppSizes.width,
              color: AppColors.clr_bg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.getAppBar(text: "Support", context: context),
                  SizedBox(height: AppSizes.height*0.025,),
                  _supportComponents.getSupportContainer(imagePath: Assets.support, heading: "Assigned",title: "This is a title ",)
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                elevation: 0.0,
                child:  Icon(Icons.add),
                backgroundColor:  AppColors.clr_bg_black,
                onPressed: (){_supportProviders.callSupportTicket(context: context, supportTicket: "asdfghh",);}
            )
        )
        );
  }
}
