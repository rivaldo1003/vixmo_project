import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/11/login_vixmo.dart';
import 'package:vixmo_new/login%20baru%20tgl%209/halaman_login.dart';
import 'package:vixmo_new/login/login_page.dart';
import 'package:vixmo_new/pages/login_fix.dart';
import 'package:vixmo_new/pages/login_page_new.dart';
import 'package:vixmo_new/screen_setting/appereance.dart';
import 'package:vixmo_new/screen_setting/lights.dart';
import 'package:vixmo_new/screen_setting/lock.dart';
import 'package:vixmo_new/screen_setting/safety.dart';
import 'package:vixmo_new/theme.dart';
import 'package:vixmo_new/widget/widget_setting.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../11/all_apps.dart';
import '../11/notifications.dart';

class Setting extends StatelessWidget {
  bool _isLogin = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 0,
                  ),
                  child: Text(
                    'Setting',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 5,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F8FA),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     blurRadius: 10,
                                  //     offset: Offset(0, 4),
                                  //     spreadRadius: 0.5,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      StreamBuilder<User?>(
                                          stream: FirebaseAuth.instance
                                              .userChanges(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .photoURL ??
                                                              ''),
                                                      fit: BoxFit.cover),
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                'no image',
                                                style: TextStyle(
                                                  fontFamily: 'SanFrancisco',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              );
                                            }
                                          }),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      StreamBuilder<User?>(
                                          stream: FirebaseAuth.instance
                                              .userChanges(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                '${FirebaseAuth.instance.currentUser!.displayName}',
                                                style:
                                                    poppinsTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            } else {
                                              return Text('');
                                            }
                                          }),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      StreamBuilder<User?>(
                                          stream: FirebaseAuth.instance
                                              .userChanges(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                '${FirebaseAuth.instance.currentUser!.email}',
                                                style:
                                                    poppinsTextStyle.copyWith(
                                                  fontSize: 12,
                                                ),
                                              );
                                            } else {
                                              return Text('');
                                            }
                                          }),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 8,
                                color: Color(0xffF6F8FA),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Lights();
                                  }));
                                },
                                child: WidgetSetting(
                                  image:
                                      'assets/icons/icons_setting/light_setting.png',
                                  title: 'Lights',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Lock();
                                  }));
                                },
                                child: WidgetSetting(
                                  image:
                                      'assets/icons/icons_setting/lock_setting.png',
                                  title: 'Lock',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Appereance();
                                  }));
                                },
                                child: WidgetSetting(
                                  image:
                                      'assets/icons/icons_setting/appereance_setting.png',
                                  title: 'Appereance',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Safety();
                                  }));
                                },
                                child: WidgetSetting(
                                  image:
                                      'assets/icons/icons_setting/warning_setting.png',
                                  title: 'Safety',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment(0, 0.95),
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1772E0),
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Text(
                            'Sign Out',
                            style: TextStyle(
                              color: Color(0xff1772E0),
                              fontFamily: 'SanFrancisco',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          content: Container(
                            child: Text(
                              'Are you sure you want to leave?',
                              style: TextStyle(
                                color: blackColor,
                                fontFamily: 'SanFrancisco',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xff1772E0),
                                  fontFamily: 'SanFrancisco',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  color: Color(0xff1772E0),
                                  fontFamily: 'SanFrancisco',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                GoogleSignIn().signOut();
                                _facebookLogin.logOut();
                                await Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginVixmo();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SanFrancisco',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
