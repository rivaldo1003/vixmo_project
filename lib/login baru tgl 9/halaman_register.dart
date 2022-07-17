import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/components_home/bottom_navigation.dart';
import 'package:vixmo_new/login%20baru%20tgl%209/halaman_login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../theme.dart';

class HalamanRegister extends StatelessWidget {
  TextEditingController _fullname = TextEditingController();
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
            color: Color(0xff1D365A),
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
                    return HalamanLogin();
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
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.3,
                    // color: Colors.red,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/half_car4.png',
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.3),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Image.asset(
                      'assets/images/vixmo_fix.png',
                      width: 150,
                      height: 150,
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
                      controller: _fullname,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF6F8FA),
                        contentPadding: EdgeInsets.all(14),
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontWeight: FontWeight.w400,
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
                        hintStyle: TextStyle(
                          fontFamily: 'SanFrancisco',
                          color: greyFont,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
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
                        hintStyle: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontWeight: FontWeight.w400,
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
                          primary: Color(0xff1D365A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'SanFrancisco',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
                          endIndent: 20,
                          indent: 20,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        'Or',
                        style: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
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
                        style: TextStyle(
                          fontFamily: 'SanFrancisco',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return HalamanLogin();
                          }));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'SanFrancisco',
                            color: Color(0xff1D365A),
                            fontWeight: FontWeight.w700,
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
