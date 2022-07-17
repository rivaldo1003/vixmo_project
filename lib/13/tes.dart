import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class TesAC extends StatefulWidget {
  @override
  State<TesAC> createState() => _TesACState();
}

class _TesACState extends State<TesAC> {
  bool isPressedACON = false;
  bool isPressedACLevel1 = false;
  bool isPressedACLevel2 = false;

  bool isPressedLamp = false;
  bool isPressedLock = false;
  bool isPressedTrunk = false;

  final String font = 'SanFrancisco';
  int groupValue = 0;

  final Map<int, Widget> logoWidgets = {
    0: Text('Helo 1'),
    1: Text('Helo 2'),
  };

  static Widget giveCenter(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
      ),
    );
  }

  List<Widget> bodies = [
    giveCenter('Consumption'),
    giveCenter('Trip'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Consumption',
                      style: TextStyle(
                          fontFamily: font,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: blackColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 4,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Color(0xff1772E0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 26,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Trip',
                      style: TextStyle(
                        fontFamily: font,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 4,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CupertinoSlidingSegmentedControl<int>(
              children: logoWidgets,
              onValueChanged: (newGroupValue) {
                setState(
                  () {
                    groupValue = newGroupValue!;
                  },
                );
              },
              groupValue: groupValue,
            ),
            bodies[groupValue],
            Positioned(
              left: 0,
              right: 0,
              bottom: -50,
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  top: 0,
                  right: 20,
                  bottom: 0,
                ),
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPressedLock = !isPressedLock;
                            });
                          },
                          child: !isPressedLock
                              ? Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icons_home/menu_new/unlock24_grey.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icons_home/menu_new/lock24_blue.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          !isPressedLock ? 'Unlock' : 'Lock',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff111619),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPressedACON = true;
                            });
                          },
                          child: !isPressedACON
                              ? Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 14,
                                      bottom: 5,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/icons/icons_home/menu_new/ac24_grey.png',
                                          height: 24,
                                          width: 24,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 3,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                color: Color(0xffE8F1FC),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            //0xff1772E0
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 3,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                color: Color(0xffE8F1FC),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 3,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                color: Color(0xffE8F1FC),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPressedACLevel1 = true;
                                    });
                                  },
                                  child: !isPressedACLevel1
                                      ? Container(
                                          height: 52,
                                          width: 52,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffF6F8FA),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 14,
                                              bottom: 5,
                                            ),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/icons_home/menu_new/ac24_blue.png',
                                                  height: 24,
                                                  width: 24,
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 3,
                                                      width: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff1772E0),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    //0xff1772E0
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 3,
                                                      width: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffE8F1FC),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 3,
                                                      width: 3,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffE8F1FC),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isPressedACLevel2 = true;
                                            });
                                          },
                                          child: !isPressedACLevel2
                                              ? Container(
                                                  height: 52,
                                                  width: 52,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffF6F8FA),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 14,
                                                      bottom: 5,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/icons_home/menu_new/ac24_blue.png',
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 3,
                                                              width: 3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff1772E0),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            //0xff1772E0
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 3,
                                                              width: 3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff1772E0),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 3,
                                                              width: 3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xffE8F1FC),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isPressedACON =
                                                          !isPressedACON;
                                                      isPressedACLevel1 =
                                                          !isPressedACLevel1;
                                                      isPressedACLevel2 =
                                                          !isPressedACLevel2;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    width: 52,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffF6F8FA),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 14,
                                                        bottom: 5,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Image.asset(
                                                            'assets/icons/icons_home/menu_new/ac24_blue.png',
                                                            height: 24,
                                                            width: 24,
                                                          ),
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: 3,
                                                                width: 3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xff1772E0),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              //0xff1772E0
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                height: 3,
                                                                width: 3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xff1772E0),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Container(
                                                                height: 3,
                                                                width: 3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xff1772E0),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'AC',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff111619),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPressedLamp = !isPressedLamp;
                            });
                          },
                          child: !isPressedLamp
                              ? Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icons_home/menu_new/lamp24_grey.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icons_home/menu_new/lamp24_blue.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Lamp',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff111619),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPressedTrunk = !isPressedTrunk;
                            });
                          },
                          child: !isPressedTrunk
                              ? Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icons_home/menu_new/trunk24_grey.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF6F8FA),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/icons/icons_home/menu_new/trunk24_blue.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Trunk',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff111619),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSegment(String text) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
