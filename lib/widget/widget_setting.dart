import 'package:flutter/material.dart';
import 'package:vixmo_new/theme.dart';

class WidgetSetting extends StatelessWidget {
  String title;
  String image;

  WidgetSetting({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: 30,
      // decoration: BoxDecoration(
      //   // color: Colors.red,
      //   borderRadius: BorderRadius.circular(20),
      // ),
      child: Row(
        children: <Widget>[
          Image.asset(
            image,
            width: 28,
            height: 28,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'SanFrancisco',
              color: greyFont,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
