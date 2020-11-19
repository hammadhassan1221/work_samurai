import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/widgets/widgets.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool onclick, onclick1, onclick2, onclick3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onclick = onclick1 = onclick2 = onclick3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
        body: Container(
          child: ListView(
             children: [
               Container(
                 color: AppColors.clr_bg,
                 height: AppSizes.height,
                 width: AppSizes.width,
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CommonWidgets.getAppBar(text: "Settings", onPress: (){Navigator.pop(context);}, imagepath: Assets.barArrow),
                       Container(
                         constraints: new BoxConstraints(
                             maxHeight: 130.0,
                             maxWidth: 130.0
                         ),
                         decoration: new BoxDecoration(
                           shape: BoxShape.circle,
                           image: new DecorationImage(
                             image: new AssetImage(Assets.support),
                             fit: BoxFit.cover,
                           ),
                         ),
                         child: Stack(
                           children: [
                             new Positioned(
                               right: 10.0,
                               bottom: 0,
                               child: Container(
                                 constraints: new BoxConstraints(
                                     maxHeight: 30.0,
                                     maxWidth: 30.0
                                 ),
                                 decoration: new BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                         color:Color(0xFFdedede),
                                         offset: Offset(2,2)
                                     ),
                                   ],
                                   color: AppColors.clr_white,
                                   shape: BoxShape.circle,
                                 ),
                                 child: GestureDetector(
                                   onTap: (){
                                   },
                                   child: Padding(
                                       padding: const EdgeInsets.all(1.0),
                                       child: Image.asset(Assets.edit, width: 50.0, height: 50.0)
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: AppSizes.height*0.05,
                       ),
                       GestureDetector(
                           onTap: () {
                             setState(() {
                               onclick = !onclick;
                             });
                           },
                           child: Container(
                               width: AppSizes.width * 0.95,
                               height: AppSizes.height*0.08,
                               padding: EdgeInsets.all(AppSizes.width*0.03),
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   color: AppColors.clr_bg_grey,
                                 ),
                                 borderRadius: BorderRadius.circular(5),
                                 color: AppColors.clr_bg,
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Container(
                                           child: Text(
                                             "Full Name",
                                             style: TextStyle(
                                               fontFamily: "MuliBold",
                                               fontSize: 15,
                                             ),
                                           )
                                       ),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Icon(
                                         onclick
                                             ? Icons.keyboard_arrow_up
                                             : Icons.keyboard_arrow_down,
                                       ),
                                     ],
                                   )

                                 ],
                               )
                           )),
                       AnimatedContainer(
                           duration: const Duration(milliseconds: 200),
                           height: onclick ? AppSizes.height * 0.08 : 0,
                           child: Container(
                             width: AppSizes.width*0.95,
                             padding: EdgeInsets.all(10.0),
                             decoration: BoxDecoration(
                               border: Border(
                                 right: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 bottom: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 left: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                               ),
                               color: Colors.white,
                             ),
                             child: TextField(
                                cursorColor: AppColors.clr_bg_black2,
                                decoration: InputDecoration(
                                labelText: "Full Name",
                                labelStyle: TextStyle(fontSize: 12,
                                color: AppColors.clr_bg_black2,
                                decorationColor: AppColors.clr_bg_black,
                                fontFamily: 'MuliRegular',))),
                           )
                       ),
                       SizedBox(
                         height: AppSizes.height*0.01,
                       ),
                       GestureDetector(
                           onTap: () {
                             setState(() {
                               onclick1 = !onclick1;
                             });
                           },
                           child:Container(
                               width: AppSizes.width * 0.95,
                               height: AppSizes.height*0.08,
                               padding: EdgeInsets.all(AppSizes.width*0.03),
                               decoration: BoxDecoration(
                                 border: Border.all(
                                   color: AppColors.clr_bg_grey,
                                 ),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Container(
                                           child: Text(
                                             "Address",
                                             style: TextStyle(
                                               fontFamily: "MuliBold",
                                               fontSize: 15,
                                             ),
                                           )
                                       ),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       Icon(
                                         onclick1
                                             ? Icons.keyboard_arrow_up
                                             : Icons.keyboard_arrow_down,
                                       ),
                                     ],
                                   )

                                 ],
                               )
                           ),),
                       AnimatedContainer(
                           duration: const Duration(milliseconds: 200),
                           height: onclick1 ? AppSizes.height * 0.08 : 0,
                           child: Container(
                             width: AppSizes.width*0.95,
                             padding: EdgeInsets.all(10.0),
                             decoration: BoxDecoration(
                               border: Border(
                                 right: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 bottom: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 left: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                               ),
                               color: Colors.white,
                             ),
                             child: TextField(
                                 cursorColor: AppColors.clr_bg_black2,
                                 decoration: InputDecoration(
                                     labelText: "Address",
                                     labelStyle: TextStyle(fontSize: 12,
                                       color: AppColors.clr_bg_black2,
                                       decorationColor: AppColors.clr_bg_black,
                                       fontFamily: 'MuliRegular',))),
                           )
                       ),
                       SizedBox(
                         height: AppSizes.height*0.01,
                       ),
                       GestureDetector(
                         onTap: () {
                           setState(() {
                             onclick2 = !onclick2;
                           });
                         },
                         child:Container(
                             width: AppSizes.width * 0.95,
                             height: AppSizes.height*0.08,
                             padding: EdgeInsets.all(AppSizes.width*0.03),
                             decoration: BoxDecoration(
                               border: Border.all(
                                 color: AppColors.clr_bg_grey,
                               ),
                               borderRadius: BorderRadius.circular(5),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Container(
                                         child: Text(
                                           "Description",
                                           style: TextStyle(
                                             fontFamily: "MuliBold",
                                             fontSize: 15,
                                           ),
                                         )
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Icon(
                                       onclick2
                                           ? Icons.keyboard_arrow_up
                                           : Icons.keyboard_arrow_down,
                                     ),
                                   ],
                                 )

                               ],
                             )
                         ),),
                       AnimatedContainer(
                           duration: const Duration(milliseconds: 200),
                           height: onclick2 ? AppSizes.height * 0.08 : 0,
                           child: Container(
                             width: AppSizes.width*0.95,
                             padding: EdgeInsets.all(10.0),
                             decoration: BoxDecoration(
                               border: Border(
                                 right: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 bottom: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 left: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                               ),
                               color: Colors.white,
                             ),
                             child: TextField(
                                 cursorColor: AppColors.clr_bg_black2,
                                 decoration: InputDecoration(
                                     labelText: "Description",
                                     labelStyle: TextStyle(fontSize: 12,
                                       color: AppColors.clr_bg_black2,
                                       decorationColor: AppColors.clr_bg_black,
                                       fontFamily: 'MuliRegular',))),
                           )
                       ),
                       SizedBox(
                         height: AppSizes.height*0.01,
                       ),
                       GestureDetector(
                         onTap: () {
                           setState(() {
                             onclick3 = !onclick3;
                           });
                         },
                         child: Container(
                             width: AppSizes.width * 0.95,
                             height: AppSizes.height*0.08,
                             padding: EdgeInsets.all(AppSizes.width*0.03),
                             decoration: BoxDecoration(
                               border: Border.all(
                                 color: AppColors.clr_bg_grey,
                               ),
                               borderRadius: BorderRadius.circular(5),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Container(
                                         child: Text(
                                           "Password",
                                           style: TextStyle(
                                             fontFamily: "MuliBold",
                                             fontSize: 15,
                                           ),
                                         )
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Icon(
                                       onclick3
                                           ? Icons.keyboard_arrow_up
                                           : Icons.keyboard_arrow_down,
                                     ),
                                   ],
                                 )

                               ],
                             )
                         ),),
                       AnimatedContainer(
                           duration: const Duration(milliseconds: 200),
                           height: onclick3 ? AppSizes.height * 0.08 : 0,
                           child: Container(
                             width: AppSizes.width*0.95,
                             padding: EdgeInsets.all(10.0),
                             decoration: BoxDecoration(
                               border: Border(
                                 right: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 bottom: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                                 left: BorderSide(
                                     width: 1.0, color: AppColors.clr_bg_grey),
                               ),
                               color: Colors.white,
                             ),
                             child: TextField(
                                 cursorColor: AppColors.clr_bg_black2,
                                 decoration: InputDecoration(
                                     labelText: "Password",
                                     labelStyle: TextStyle(fontSize: 12,
                                       color: AppColors.clr_bg_black2,
                                       decorationColor: AppColors.clr_bg_black,
                                       fontFamily: 'MuliRegular',))),
                           )
                       ),
                       SizedBox(
                         height: AppSizes.height*0.15,
                       ),
                       CommonWidgets.getButton(backgroundColor: AppColors.clr_bg_black, borderColor: AppColors.clr_bg_black, textColor: AppColors.clr_white, text: "Update", onPress: null)
                     ]),

               ),
             ],
          ),
        )
    )
    );
  }
}
