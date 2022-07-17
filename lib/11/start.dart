import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vixmo_new/11/register_vixmo.dart';

import 'login_vixmo.dart';

class Start extends StatelessWidget {
  final String font = 'SanFrancisco';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/logo_fix.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 30,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff111619),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Through this app, you can monitor and control your vehicle, as well as accessing other VIXMO services. Enjoy!',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff8D9BA7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 0,
                      right: 20,
                      bottom: 16,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 52,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff1772E0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return RegisterVixmo();
                              }));
                            },
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: font,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff8D9BA7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return LoginVixmo();
                                }));
                                Get.to(LoginVixmo());
                              },
                              child: Container(
                                child: Text(
                                  ' Login',
                                  style: TextStyle(
                                    fontFamily: font,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xff1772E0),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
