import 'package:flutter/material.dart';

import '../theme.dart';

class MenuHomeVixmo extends StatefulWidget {
  @override
  State<MenuHomeVixmo> createState() => _MenuHomeVixmoState();
}

class _MenuHomeVixmoState extends State<MenuHomeVixmo> {
  bool isPressedLock = false;
  bool isPressedACON = false;
  bool isPressedACLevel1 = false;
  bool isPressedACLevel2 = false;

  bool isPressedLamp = false;
  bool isPressedTrunk = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        top: 0,
        right: 20,
        bottom: 0,
      ),
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  color: Color(0xff1772E0),
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
                                                          color:
                                                              Color(0xff1772E0),
                                                          shape:
                                                              BoxShape.circle,
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
                                                          color:
                                                              Color(0xff1772E0),
                                                          shape:
                                                              BoxShape.circle,
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
                                                          color:
                                                              Color(0xffE8F1FC),
                                                          shape:
                                                              BoxShape.circle,
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
                                                isPressedACON = !isPressedACON;
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
                                                            shape:
                                                                BoxShape.circle,
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
                                                            shape:
                                                                BoxShape.circle,
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
                                                            shape:
                                                                BoxShape.circle,
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
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/music24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Music',
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
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/volume24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Volume',
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
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/mirror24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Mirror',
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
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/music24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Music',
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
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/music24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Music',
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
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/music24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Music',
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
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/music24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Music',
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
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F8FA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icons_home/menu_new/music24_grey.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Music',
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
        ],
      ),
    );
  }
}
