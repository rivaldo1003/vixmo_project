import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vixmo_new/pages/divider.dart';
import 'package:vixmo_new/pages/login_page_new.dart';
import 'package:vixmo_new/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterNew extends StatefulWidget {
  @override
  State<RegisterNew> createState() => _RegisterNewState();
}

class _RegisterNewState extends State<RegisterNew> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
  }

  _registerSuccess(context) {
    Alert(
        context: context,
        title: 'Register Success',
        style: AlertStyle(
          titleStyle: poppinsTextStyle.copyWith(),
        ),
        desc: 'Data berhasil disimpan oleh sistem',
        type: AlertType.success,
        buttons: [
          DialogButton(
            child: Text(
              'Login Now',
              style: poppinsTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginNew();
                  },
                ),
              );
            },
          ),
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Started',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Welcome to VIXMO apps',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 18,
                              color: greyFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffecf1f5),
              ),
              Positioned(
                top: 180,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 24,
                          right: 0,
                          bottom: 0,
                        ),
                        child: Text(
                          'Register',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     left: 20,
                      //     top: 16,
                      //     right: 20,
                      //     bottom: 0,
                      //   ),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       hintText: 'Full Name',
                      //       // labelText: 'Email',
                      //       labelStyle: poppinsTextStyle.copyWith(
                      //         color: greyFont,
                      //       ),
                      //       hintStyle: poppinsTextStyle.copyWith(
                      //         color: greyFont,
                      //       ),
                      //       prefixIcon: Icon(
                      //         Icons.person,
                      //         color: greyFont,
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.black,
                      //         ),
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: greyFont,
                      //         ),
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                          bottom: 0,
                        ),
                        child: TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            // labelText: 'Email',
                            labelStyle: poppinsTextStyle.copyWith(
                              color: greyFont,
                            ),
                            hintStyle: poppinsTextStyle.copyWith(
                              color: greyFont,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: greyFont,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greyFont,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                          bottom: 0,
                        ),
                        child: TextField(
                          controller: _password,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            // labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: greyFont,
                            ),
                            labelStyle: poppinsTextStyle.copyWith(
                              color: greyFont,
                            ),
                            hintStyle: poppinsTextStyle.copyWith(
                              color: greyFont,
                            ),
                            prefixIcon: Icon(
                              Icons.key,
                              color: greyFont,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: greyFont,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          top: 24,
                          right: 20,
                          bottom: 16,
                        ),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff1772E0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _email.text,
                                        password: _password.text);
                                _registerSuccess(context);
                              } on FirebaseAuthException catch (e) {
                                showNotif(context, e.message.toString());
                              }
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DividerCustom(),
                          Text(
                            'or',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          DividerCustom(),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/icons/google_icon.png',
                              height: 32,
                              width: 32,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Image.asset(
                              'assets/icons/facebook_icon.png',
                              height: 32,
                              width: 32,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Image.asset(
                              'assets/icons/microsoft_icon_new.png',
                              height: 32,
                              width: 32,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Image.asset(
                              'assets/icons/apple_icon.png',
                              height: 32,
                              width: 32,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 24,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: poppinsTextStyle.copyWith(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return LoginNew();
                            }));
                          },
                          child: Text(
                            'Login',
                            style: poppinsTextStyle.copyWith(
                              color: Color(0xff1772E0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNotif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message.toString()),
      ),
    );
  }
}
