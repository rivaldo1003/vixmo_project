import 'package:flutter/material.dart';

class WidgetMenu extends StatelessWidget {
  const WidgetMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
        top: 0,
        right: 25,
        bottom: 0,
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/icons/icons_home/unlock.png',
            height: 28,
            width: 28,
          ),
          Text('Unlock'),
        ],
      ),
    );
  }
}
