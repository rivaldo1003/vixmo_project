import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/pages/login_fix.dart';
import 'package:vixmo_new/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../components_home/bottom_navigation.dart';

class RegisterNewFix extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  final String font = 'SanFrancisco';

  _registerSuccess(context) {
    Alert(
        context: context,
        title: 'Register Success',
        style: AlertStyle(
          descStyle: TextStyle(
            fontFamily: font,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleStyle: TextStyle(
            fontFamily: font,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        desc: 'Data berhasil disimpan oleh sistem',
        type: AlertType.success,
        buttons: [
          DialogButton(
            color: Color(0xff1772E0),
            child: Text(
              'Login Now',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: font,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginNewFix();
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
      backgroundColor: Color(0xffF6F8FA),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 175,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/images/image_login3.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 45,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Get Started',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Welcome to VIXMO',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // color: Color(0xffF6F8FA),
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 140,
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        top: 8,
                        right: 20,
                        bottom: 0,
                      ),
                      child: TextField(
                        controller: _name,
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
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        top: 16,
                        right: 20,
                        bottom: 0,
                      ),
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
                      margin: EdgeInsets.only(
                        left: 20,
                        top: 8,
                        right: 20,
                        bottom: 16,
                      ),
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
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            endIndent: 10,
                            indent: 20,
                          ),
                        ),
                        Text(
                          'Or',
                          style: poppinsTextStyle.copyWith(),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 10,
                            endIndent: 20,
                          ),
                        ),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 24,
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
                          return LoginNewFix();
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
