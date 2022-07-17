import 'package:flutter/material.dart';
import 'package:vixmo_new/theme.dart';

class Navbar extends StatelessWidget {
  String title;
  String secondTitle;

  Navbar({required this.title, required this.secondTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: poppinsTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.25,
            ),
          ),
          Text(
            secondTitle,
            style: poppinsTextStyle.copyWith(
              fontSize: 14,
              color: greyFont,
              letterSpacing: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
