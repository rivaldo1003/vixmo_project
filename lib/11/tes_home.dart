import 'package:flutter/material.dart';
import 'package:vixmo_new/11/all_apps.dart';
import 'package:vixmo_new/11/notifications.dart';
import 'package:vixmo_new/11/shimmer_tes.dart';
import 'package:vixmo_new/11/tes_battery.dart';
import 'package:vixmo_new/pages/widget_battery/baterry_graphic_consumption.dart';
import 'package:vixmo_new/theme.dart';

class TesHome extends StatefulWidget {
  @override
  State<TesHome> createState() => _TesHomeState();
}

class _TesHomeState extends State<TesHome> with SingleTickerProviderStateMixin {
  final String font = 'SanFrancisco';

  bool isPressedLock = false;
  bool isPressedACON = false;
  bool isPressedACLevel1 = false;
  bool isPressedACLevel2 = false;

  bool isPressedLamp = false;
  bool isPressedTrunk = false;

  Animation<Color?>? animation;
  Animation<Color?>? animation2;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.white, end: Color(0xff06DC69)).animate(curve);
    animation2 =
        ColorTween(begin: Colors.black, end: Colors.white).animate(curve);

    animation!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
        setState(() {});
      },
    );
    animation2!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
        setState(() {});
      },
    );
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NotificationsVixmo();
                      }));
                    },
                    child: Image.asset(
                      'assets/icons/icons_home/bell.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Text(
                    'VIXMO ZERO',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return AllApps();
                        }),
                    child: Image.asset(
                      'assets/icons/icons_home/apps.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                !isPressedLamp
                    ? 'assets/images/tes1.png'
                    : 'assets/images/tes2.png',
                height: 300,
              ),
            ),
            Container(
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
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 0,
                right: 20,
                bottom: 0,
              ),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner_warning.png'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/icons_home/warning.png',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Service Information',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff111619),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Please service your car on time',
                          style: TextStyle(
                            fontFamily: font,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 35,
                            width: 75,
                            decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return NotificationsVixmo();
                                  }));
                                },
                                splashColor: Color(0xffFFECB9),
                                borderRadius: BorderRadius.circular(5),
                                child: Center(
                                  child: Text(
                                    'BOOK',
                                    style: TextStyle(
                                        fontFamily: font,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 0,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return TesBattery();
                            }));
                          },
                          child: Container(
                            height: 86,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffF6F8FA),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  AnimatedBuilder(
                                    animation: animation!,
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: animation!.value,
                                          shape: BoxShape.circle,
                                          // border: Border.all(color: Colors.blue, width: 10),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/icons/icons_home/battery_new_only.png',
                                            height: 24,
                                            width: 24,
                                            color: animation2!.value,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // Container(
                                  //   height: 40,
                                  //   width: 40,
                                  //   child: Image.asset(
                                  //     'assets/icons/icons_home/battery_new.png',
                                  //     height: 40,
                                  //     width: 40,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '96%',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          fontFamily: font,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Battery Level',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: font,
                                          color: Color(0xff8D9BA7),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 86,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF6F8FA),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icons_home/est_range.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '75 km',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: font,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Est. Range',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: font,
                                        color: Color(0xff8D9BA7),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 86,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF6F8FA),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icons_home/sn.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '63VJAK',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: font,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'S/N',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: font,
                                        color: Color(0xff8D9BA7),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 86,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF6F8FA),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icons_home/license.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'L71XMO',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: font,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'License',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: font,
                                        color: Color(0xff8D9BA7),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    controller!.dispose();
    super.dispose();
  }

  Widget buildImage(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          width: 52,
          height: 52,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: font,
            fontWeight: FontWeight.w400,
            color: Color(0xff8D9BA7),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

