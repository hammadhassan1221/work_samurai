import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/card_details/card_details_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'card_details_components.dart';

class CardDetails extends StatefulWidget {
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  CardDetailsComponents _cardDetailsComponents;
  CardDetailsProvider _cardDetailsProvider;
  TextEditingController _bankName, _accountName, _accountHolder,_accountNumber, _bsbNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardDetailsComponents = CardDetailsComponents();
    Future.delayed(Duration.zero, () {
      _cardDetailsProvider.init(context: context);
    });
    _cardDetailsProvider = Provider.of<CardDetailsProvider>(context, listen : false);
    _accountHolder = TextEditingController();
    _accountName = TextEditingController();
    _accountNumber = TextEditingController();
    _bankName = TextEditingController();
    _bsbNum = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CardDetailsProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.getAppBar(text: "Bank Information", context: context),
            _cardDetailsComponents.getHeading(text: "Payment Methods"),
            _cardDetailsComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "Account Name",
                controller: _accountName,
                isPassword: false),
            _cardDetailsComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "BSB",
                controller: _bsbNum,
                isPassword: false),
            _cardDetailsComponents.getInputField(
                backgroundColor: AppColors.clr_bg,
                borderColor: AppColors.sign_field,
                textColor: AppColors.clr_bg_black,
                text: "Account Number",
                controller: _accountNumber,
                isPassword: false),
            Expanded(
                child: CommonWidgets.getSignUpButton(
                    context: context, onPress: () { _cardDetailsProvider.callBankInfoAPI(
                    context: context,
                    bankName: _bankName.text.toString(),
                    accountNumber: _accountNumber.text.toString(),
                    accountHolder: _accountName.text.toString(),
                    bsbNum: _bsbNum.text.toString());
                }, text: "Update Details")),
            SizedBox(
              height: AppSizes.height * 0.025,
            ),
          ],
        ),
      ),
    ));
  }
}
