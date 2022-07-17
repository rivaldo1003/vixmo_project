import 'package:flutter/material.dart';
import 'package:vixmo_new/11/tes_home.dart';
import 'package:vixmo_new/login%20baru%20tgl%209/new_home.dart';
import 'package:vixmo_new/pages/camera.dart';
import 'package:vixmo_new/pages/battery.dart';
import 'package:vixmo_new/pages/location.dart';
import 'package:vixmo_new/pages/setting.dart';
import 'package:vixmo_new/theme.dart';
import '../pages/home.dart';

class BottomNavigationHomePage extends StatefulWidget {
  @override
  State<BottomNavigationHomePage> createState() =>
      _BottomNavigationHomePageState();
}

class _BottomNavigationHomePageState extends State<BottomNavigationHomePage> {
  @override
  final String font = 'SanFrancisco';
  int _selectedItemIndex = 0;

  final List<Widget> _pages = [
    TesHome(),
    // Battery(),
    Location(),
    Camera(),
    Setting(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedItemIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffF6F8FA),
              blurRadius: 0,
              spreadRadius: 0.5,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            buildBottomNavBarItem(
              context,
              'assets/icons/icons_bottom_home/grey/home_grey.png',
              0,
              true,
              'assets/icons/icons_bottom_home/blue/home_blue.png',
              'Home',
            ),
            // buildBottomNavBarItem(
            //   context,
            //   'assets/icons/icons_bottom_home/grey/battery_grey.png',
            //   1,
            //   false,
            //   'assets/icons/icons_bottom_home/blue/battery_blue.png',
            //   'Battery',
            // ),
            buildBottomNavBarItem(
              context,
              'assets/icons/icons_bottom_home/grey/map_grey.png',
              1,
              false,
              'assets/icons/icons_bottom_home/blue/map_blue.png',
              'Map',
            ),
            buildBottomNavBarItem(
              context,
              'assets/icons/icons_bottom_home/grey/camera_grey.png',
              2,
              false,
              'assets/icons/icons_bottom_home/blue/camera_blue.png',
              'Camera',
            ),
            buildBottomNavBarItem(
              context,
              'assets/icons/icons_bottom_home/grey/setting_grey.png',
              3,
              false,
              'assets/icons/icons_bottom_home/blue/setting_blue.png',
              'Setting',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavBarItem(
    BuildContext context,
    String img,
    int index,
    bool isActive,
    String img1,
    String title,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 72,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _selectedItemIndex == index ? img1 : img,
              height: 24,
              width: 24,
            ),
            SizedBox(
              height: 4,
            ),
            _selectedItemIndex == index
                ? Text(
                    title,
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
                : Text(title,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: font,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffC1CCD5),
                    )),
          ],
        ),
        decoration: _selectedItemIndex == index
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: greyFont,
                    width: 0.1,
                  ),
                ),
                // border: Border(
                //   top: BorderSide(
                //     color: colorIconBlue,
                //     width: 2,
                //   ),
                // ),
                // gradient: LinearGradient(
                //   colors: [
                //     colorIconBlue.withOpacity(0.07),
                //     Colors.white.withOpacity(0.008),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                color: _selectedItemIndex == index
                    ? Colors.transparent
                    : colorBottomNav,
              )
            : BoxDecoration(
                // color: Colors.transparent,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.red,
                //     blurRadius: 20,
                //     spreadRadius: 8,
                //   )
                // ],
                border: Border(
                  top: BorderSide(
                    color: greyFont,
                    width: 0.1,
                  ),
                ),
              ),
      ),
    );
  }
}
