import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/11/login_vixmo.dart';
import 'package:vixmo_new/theme.dart';

import '../components_home/bottom_navigation.dart';
import '../pages/register_fix.dart';

class RegisterVixmo extends StatelessWidget {
  final String font = 'SanFrancisco';
  Color colorFontGrey = Color(0xff888FA6);

  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 56,
                  right: 20,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: font,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Welcome to VIXMO ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: font,
                        color: greyFont,
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      child: TextField(
                        controller: _fullname,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF6F8FA),
                          contentPadding: EdgeInsets.all(14),
                          hintText: 'Full Name',
                          hintStyle: poppinsTextStyle.copyWith(
                            color: greyFont,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: greyFont,
                            size: 20,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF6F8FA),
                          contentPadding: EdgeInsets.all(14),
                          hintText: 'Email',
                          hintStyle: poppinsTextStyle.copyWith(
                            color: greyFont,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: greyFont,
                            size: 20,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDAE1E7),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: TextField(
                        obscureText: true,
                        controller: _password,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF6F8FA),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: greyFont,
                          ),
                          contentPadding: EdgeInsets.all(14),
                          hintText: 'Password',
                          hintStyle: poppinsTextStyle.copyWith(
                            color: greyFont,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: greyFont,
                            size: 20,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDAE1E7),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff1772E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 14,
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
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            endIndent: 30,
                            indent: 0,
                            thickness: 1,
                          ),
                        ),
                        Text(
                          'Or',
                          style: TextStyle(
                            fontFamily: font,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 30,
                            endIndent: 0,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () async {
                              if (FirebaseAuth.instance.currentUser == null) {
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
                                      MaterialPageRoute(builder: (context) {
                                    return BottomNavigationHomePage();
                                  }));
                                }
                              } else {
                                GoogleSignIn().signOut();
                                FirebaseAuth.instance.signOut();
                              }
                            },
                            child: buildImage('assets/icons/google_icon.png'),
                          ),
                          SizedBox(width: 40),
                          buildImage('assets/icons/facebook_icon.png'),
                          SizedBox(width: 40),
                          buildImage('assets/icons/microsoft_icon.png'),
                          SizedBox(width: 40),
                          buildImage('assets/icons/apple_icon.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 28,
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return LoginVixmo();
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
            ],
          ),
        ),
      ),
    );
  }

  Image buildImage(String img) {
    return Image.asset(
      img,
      height: 32,
      width: 32,
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
