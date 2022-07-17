import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixmo_new/components_home/menu_bottom_sheet_home_more.dart';
import 'package:vixmo_new/theme.dart';

class MenuHome extends StatefulWidget {
  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  int groupValue = 0;
  final Map<int, Widget> widgets = {
    0: Image.asset(
      'assets/icons/icons_more/group_icon.png',
      height: 24,
      width: 24,
    ),
    1: Image.asset(
      'assets/icons/icons_more/list_icon.png',
      height: 24,
      width: 24,
    ),
  };

  List<Widget> bodies = [
    MenuBottomTes(),
    ListViewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.9,
        // height: 470,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xffDAE1E7).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 0,
              ),
              height: 400,
              decoration: BoxDecoration(
                // color: Colors.black26.withOpacity(0.3),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 0,
                top: 40,
                right: 20,
                bottom: 40,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 0,
                        right: 20,
                        bottom: 0,
                      ),
                    ),
                    CupertinoSlidingSegmentedControl<int>(
                      children: widgets,
                      onValueChanged: (newGroupValue) {
                        setState(
                          () {
                            groupValue = newGroupValue!;
                          },
                        );
                      },
                      groupValue: groupValue,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 0,
                top: 0,
                right: 0,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  bodies.elementAt(groupValue),
                ],
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
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Pusat Kontrol',
              style: poppinsTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          height: 10,
        ),

        //Contianer2
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Pusat Kontrol',
              style: poppinsTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Pusat Kontrol',
              style: poppinsTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      // color: Colors.grey[200],
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
            style: poppinsTextStyle.copyWith(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
