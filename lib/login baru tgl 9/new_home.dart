import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vixmo_new/theme.dart';

class NewHome extends StatelessWidget {
  final String font = 'SanFrancisco';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff2C3036),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 0,
                top: 20,
                right: 0,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Vixmo Zero',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: Color(0xff34C759),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.notifications,
                    color: greyFont,
                  ),
                  Container(
                    width: 165,
                    height: 56,
                    decoration: BoxDecoration(
                      color: greyNew,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xffCCCCCC).withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/icons_home/parking_grey.png',
                          height: 26,
                          width: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Parking \nBrake Off',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: greyFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/icons/icons_home/sein.png',
                    height: 24,
                    width: 24,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    top: 0,
                    right: 16,
                    bottom: 0,
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   color: Color(0xffEFEFEF),
                  //   borderRadius: BorderRadius.circular(25),
                  //   border: Border.all(
                  //     color: Color(0xff8F939A),
                  //   ),
                  // ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          top: 20,
                          right: 00,
                          bottom: 0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircularPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              radius: 75,
                              lineWidth: 20,
                              percent: 0.7,
                              linearGradient: LinearGradient(
                                colors: [
                                  Color(0xff50AF05),
                                  Color(0xffF79410),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              // progressColor: Colors.deepPurple,
                              // backgroundColor: Colors.deepPurple.shade100,
                              circularStrokeCap: CircularStrokeCap.butt,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '70%',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Battery',
                                    style: TextStyle(
                                      fontFamily: font,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 140,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.grey.shade200,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 0.3,
                                          offset: Offset.zero,
                                          blurRadius: 8)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'KM Driven',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '2250 km',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Type Model 63VJAK',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: greyColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      'Registration Exp',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Dec 20, 2024',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: greyColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Cycle Count',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '20',
                                      style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 50,
                  child: Image.asset(
                    'assets/images/zero_hd.png',
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
