import 'package:flutter/material.dart';
import 'package:vixmo_new/components_home/bottom_sheet_notif.dart';
import 'package:vixmo_new/theme.dart';
import '../components_home/menu_home.dart';

class Home extends StatelessWidget {
  // _infoService(context) {
  //   Alert(
  //     context: context,
  //     title: "Car Information Service",
  //     desc: "Last Service 23/05/2022 \n Next Service 26/06/2023",
  //     type: AlertType.info,
  //     buttons: [
  //       DialogButton(
  //         child: Text(
  //           'DONE',
  //           style: poppinsTextStyle.copyWith(
  //             fontSize: 18,
  //             color: Colors.white,
  //           ),
  //         ),
  //         color: Color(0xff1772E0),
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //       ),
  //     ],
  //     style: AlertStyle(
  //       descStyle: TextStyle(fontSize: 14),
  //     ),
  //   ).show();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      'VIXMO ZERO',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Type Model 63VJAK',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(18))),
                        context: context,
                        builder: (context) {
                          return ShowBottomSheetNotif();
                        },
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: greyFont,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/zero_fix.png'),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  left: 25,
                  top: 15,
                  right: 25,
                  bottom: 0,
                ),
                // color: greyFont,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Registration Exp',
                            style: poppinsTextStyle.copyWith(
                              color: greyFont,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Dec 20, 2024',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: greyFont,
                        thickness: 0.3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'KM Driven',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
                              color: greyFont,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '2250 km',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: greyFont,
                        thickness: 0.7,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Cycle Count',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
                              color: greyFont,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '20',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 90,
              // ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
              ),
              //CONTAINER 1
              Expanded(
                  child: Container(
                child: Column(
                  children: <Widget>[
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
                          buildMenuHome(
                              'Lock', 'assets/icons/icons_home/lock.png'),
                          buildMenuHome('AC', 'assets/icons/icons_home/ac.png'),
                          buildMenuHome(
                              'Volume', 'assets/icons/icons_home/volume.png'),
                          buildMenuHome(
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
                          buildMenuHome(
                              'Mirror', 'assets/icons/icons_home/mirror.png'),
                          buildMenuHome(
                              'Trunk', 'assets/icons/icons_home/trunk.png'),
                          buildMenuHome(
                              'Frunk', 'assets/icons/icons_home/frunk.png'),
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(18),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return MenuHome();
                              },
                            ),
                            child: buildMenuHome(
                                'More', 'assets/icons/icons_home/more.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        )
        // bottomNavigationBar: BottomNavigationHomePage(),
        );
  }

  Container buildMenuHome(String title, String img) {
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
