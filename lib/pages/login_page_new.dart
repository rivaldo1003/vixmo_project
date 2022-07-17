import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/pages/divider.dart';
import 'package:vixmo_new/pages/register_page_new.dart';
import 'package:vixmo_new/theme.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../components_home/bottom_navigation.dart';

class LoginNew extends StatefulWidget {
  @override
  State<LoginNew> createState() => _LoginNewState();
}

class _LoginNewState extends State<LoginNew> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _isLogin = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  User? _user;

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
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
                  height: MediaQuery.of(context).size.height / 1.4,
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
                          'Login',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          top: 16,
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
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                          left: 0,
                          top: 0,
                          bottom: 0,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password ?',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          top: 8,
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
                              'Sign In',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _email.text,
                                        password: _password.text);

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return BottomNavigationHomePage();
                                }));
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
                            InkWell(
                              onTap: () async {
                                if (FirebaseAuth.instance.currentUser ==
                                    null) {
                                  GoogleSignInAccount? account =
                                  await GoogleSignIn().signIn();
                                  if (account != null) {
                                    GoogleSignInAuthentication auth =
                                    await account.authentication;
                                    OAuthCredential credential =
                                    GoogleAuthProvider.credential(
                                      accessToken: auth.accessToken,
                                      idToken: auth.idToken,
                                    );
                                    await FirebaseAuth.instance
                                        .signInWithCredential(credential);
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) {
                                              return BottomNavigationHomePage();
                                            }));
                                  }
                                } else {
                                  GoogleSignIn().signOut();
                                  FirebaseAuth.instance.signOut();
                                }
                              },
                              child: Image.asset(
                                'assets/icons/google_icon.png',
                                height: 32,
                                width: 32,
                              ),
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
                          'Don\'t have an account? ',
                          style: poppinsTextStyle.copyWith(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return RegisterNew();
                            }));
                          },
                          child: Text(
                            'Register',
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
