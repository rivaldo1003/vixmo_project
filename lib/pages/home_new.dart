import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixmo_new/theme.dart';

import '../components_home/bottom_sheet_notif.dart';
import '../components_home/menu_home.dart';

class HomeNew extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'VIXMO ZERO',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Type Model 63VJAK',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 16,
                              color: greyFont,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(18))),
                                context: context,
                                builder: (context) {
                                  return ShowBottomSheetNotif();
                                },
                              ),
                              child: Icon(
                                Icons.notifications,
                                color: greyFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/zero_fix.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 15,
                right: 20,
                bottom: 0,
              ),
              // color: greyFont,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Registration Exp',
                          style: poppinsTextStyle.copyWith(
                            color: greyFont,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Dec 20, 2024',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: greyFont,
                      thickness: 0.2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'KM Driven',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            color: greyFont,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '2250 km',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: greyFont,
                      thickness: 0.3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Cycle Count',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            color: greyFont,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '20',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 0,
                right: 20,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMenuHome('Lock', 'assets/icons/icons_home/lock.png'),
                  buildMenuHome('AC', 'assets/icons/icons_home/ac.png'),
                  buildMenuHome('Volume', 'assets/icons/icons_home/volume.png'),
                  buildMenuHome('Music', 'assets/icons/icons_home/music.png'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Contianer2
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 0,
                right: 20,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMenuHome('Mirror', 'assets/icons/icons_home/mirror.png'),
                  buildMenuHome('Trunk', 'assets/icons/icons_home/trunk.png'),
                  buildMenuHome('Frunk', 'assets/icons/icons_home/frunk.png'),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(18),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return MenuHome();
                      },
                    ),
                    child: buildMenuHome(
                        'More', 'assets/icons/icons_home/more.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildMenuHome(String title, String img) {
    return Container(
      height: 60,
      width: 60,
      // color: greyFont,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 28,
            width: 28,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: poppinsTextStyle.copyWith(),
          ),
        ],
      ),
    );
  }
}
