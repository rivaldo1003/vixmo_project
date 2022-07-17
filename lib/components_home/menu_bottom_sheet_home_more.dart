import 'package:flutter/material.dart';

import '../theme.dart';

class MenuBottomTes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 10,
            top: 0,
            right: 10,
            bottom: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildMenuBottomSheet('Lock', 'assets/icons/icons_home/lock.png'),
              buildMenuBottomSheet('AC', 'assets/icons/icons_home/ac.png'),
              buildMenuBottomSheet(
                  'Volume', 'assets/icons/icons_home/volume.png'),
              buildMenuBottomSheet(
                  'Music', 'assets/icons/icons_home/music.png'),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        //Contianer2
        Container(
          margin: EdgeInsets.only(
            left: 10,
            top: 0,
            right: 10,
            bottom: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildMenuBottomSheet(
                  'Mirror', 'assets/icons/icons_home/mirror.png'),
              buildMenuBottomSheet(
                  'Frunk', 'assets/icons/icons_home/frunk.png'),
              buildMenuBottomSheet(
                  'Trunk', 'assets/icons/icons_home/trunk.png'),
              buildMenuBottomSheet('Lock', 'assets/icons/icons_home/lock.png'),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(
            left: 10,
            top: 0,
            right: 10,
            bottom: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildMenuBottomSheet(
                  'Mirror', 'assets/icons/icons_home/mirror.png'),
              buildMenuBottomSheet(
                  'Frunk', 'assets/icons/icons_home/frunk.png'),
              buildMenuBottomSheet(
                  'Trunk', 'assets/icons/icons_home/trunk.png'),
              buildMenuBottomSheet('Lock', 'assets/icons/icons_home/lock.png'),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(
            left: 10,
            top: 0,
            right: 10,
            bottom: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildMenuBottomSheet(
                  'Mirror', 'assets/icons/icons_home/mirror.png'),
              buildMenuBottomSheet(
                  'Frunk', 'assets/icons/icons_home/frunk.png'),
              buildMenuBottomSheet(
                  'Trunk', 'assets/icons/icons_home/trunk.png'),
              buildMenuBottomSheet('Lock', 'assets/icons/icons_home/lock.png'),
            ],
          ),
        ),
      ],
    );
  }

  Container buildMenuBottomSheet(String title, String img) {
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
            height: 8,
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
