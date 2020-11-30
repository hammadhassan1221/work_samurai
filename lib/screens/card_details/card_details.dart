import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

import 'card_details_components.dart';

class CardDetails extends StatefulWidget {
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  CardComponents _cardComponents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardComponents = CardComponents();
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
                CommonWidgets.getAppBar(text: "Bank Details", context: context),
                Expanded(child: ListView(children: [ _cardComponents.getHeading(text: "Card Number"),
                  _cardComponents.getSubHeading(text: "6473 xxxx xxxx 3213"),
                  _cardComponents.getHeading(text: "Expiry Date"),
                  _cardComponents.getSubHeading(text: "04/23"),
                  _cardComponents.getHeading(text: "Cvv"),
                  _cardComponents.getSubHeading(text: "342"),
                  _cardComponents.getHeading(text: "Postal Code"),
                  _cardComponents.getSubHeading(text: "1500"),
                ],)),
                CommonWidgets.getSignUpButton(context: context, onPress: (){}, text: "Update")
              ],
            ),
          ),
        ));
  }
}