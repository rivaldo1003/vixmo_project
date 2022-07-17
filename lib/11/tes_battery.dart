import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixmo_new/pages/widget_battery/baterry_graphic_consumption.dart';
import 'package:vixmo_new/pages/widget_battery/battery_graphic_trip.dart';
import 'package:vixmo_new/theme.dart';

class TesBattery extends StatefulWidget {
  @override
  State<TesBattery> createState() => _TesBatteryState();
}

class _TesBatteryState extends State<TesBattery> {
  final String font = 'SanFrancisco';

  String? _dropDownValue;
  List _items = [
    "Weekly",
    "Monthly",
    "Yearly",
  ];

  final Map<int, Widget> logoWidget = {
    0: Text(
      'Consumption',
      style: TextStyle(
        fontFamily: 'SanFrancisco',
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
    1: Text(
      'Trip',
      style: TextStyle(
        fontFamily: 'SanFrancisco',
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  };

  int groupValue = 0;

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
    BatteryGraphicConsumption(),
    BatteryGraphicTrip(),
  ];

  bool isPressedCharging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/icons_home/arrow_left.png',
            height: 24,
            width: 24,
            scale: 4,
          ),
        ),
        title: Text(
          'Battery Resource',
          style: TextStyle(
            fontFamily: font,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff111619),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            !isPressedCharging
                ? Image.asset('assets/images/car_battery.png')
                : Image.asset('assets/images/car_battery.gif'),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 0,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Last charged to 100%',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Yesterday 18.06 AM',
                            style: TextStyle(
                              fontFamily: font,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8D9BA7),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isPressedCharging = !isPressedCharging;
                              });
                            },
                            borderRadius: BorderRadius.circular(11),
                            child: isPressedCharging
                                ? Container(
                                    height: 22,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: Color(0xff06DC69),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Charging',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 22,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: greyNew,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No Charging',
                                        style: TextStyle(
                                          fontFamily: font,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 58,
                      top: 0,
                      right: 58,
                      bottom: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Battery Level',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff8D9BA7),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '96%',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Color(0xff06DC69),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Battery Limit',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff8D9BA7),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '100%',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: FontWeight.w700,
                                fontSize: 28,
                                color: Color(0xff111619),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: <Widget>[
                          Text(
                            'Time Est.',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: greyNew,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '15 min',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Full Charge',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: greyNew,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '200 min',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Distance',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: greyNew,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '120 mi',
                            style: TextStyle(
                              fontFamily: font,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 8,
              color: Color(0xffF6F8FA),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: Color(0xffF6F8FA),
                    children: logoWidget,
                    onValueChanged: (newGroupValue) {
                      setState(() {
                        this.groupValue = newGroupValue!;
                      });
                    },
                    groupValue: groupValue,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  bodies.elementAt(groupValue),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 84,
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            top: 16,
            right: 20,
            bottom: 16,
          ),
          height: 52,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Stop',
              style: TextStyle(
                fontFamily: font,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
