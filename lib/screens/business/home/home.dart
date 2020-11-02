import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/assets.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/screens/Business/home/pages/book/book.dart';
import 'package:work_samurai/screens/business/home/pages/account/account.dart';
import 'package:work_samurai/screens/business/home/pages/messages_chat/messages.dart';
import 'package:work_samurai/screens/business/home/pages/tracks/track.dart';
import 'home_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeProvider homeProvider;
  final List<Widget> children = [
    Booking(),
    Tracks(),
    BusinessChatRoom(),
    Account(),
  ];
  int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.init(context: context);
  }

  /* void onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body:children[_currentIndex] ,

        bottomNavigationBar: BottomNavigationBar(
           currentIndex: _currentIndex,
                     backgroundColor: AppColors.clr_bg,
                     type: BottomNavigationBarType.fixed,
                     onTap: (index) {
                       setState(() {
                         _currentIndex = index;
                       });
                     },
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.gigs,
                  height: 20,width: 20,),
              ),
              title: Text(
                "Book",style: TextStyle(
                color: _currentIndex == 0
                    ? AppColors.clr_bg_black
                    : Colors.black54,
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.track,height: 20,width: 20,),
              ),
              title: Text(
                "Track",style: TextStyle(
                color: _currentIndex == 0
                    ? AppColors.clr_bg_black
                    : Colors.black54
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.msgs,height: 20,width: 20,),
              ),
              title: Text(
                "Messages",style: TextStyle(
                color: _currentIndex == 0
                    ? AppColors.clr_bg_black
                    : Colors.black54,
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.account,height: 20,width: 20,),
              ),
              title: Text(
                "Account",style: TextStyle(
                color: _currentIndex == 0
                    ? AppColors.clr_bg_black
                    : Colors.black54
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                child: Image.asset(Assets.alerts,height: 20,width: 20,),
              ),
              title: Text(
                "Alerts",style: TextStyle(
                color: _currentIndex == 0
                    ? AppColors.clr_bg_black
                    : Colors.black54
              ),
              ),
            ),
          ],
        ),
      ) );
  }
}
