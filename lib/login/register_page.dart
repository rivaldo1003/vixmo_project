import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vixmo_new/login/login_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    return LoginPage();
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
      backgroundColor: Color(0xffA0ACBC),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 90),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/vixmo_logo.png',
                      height: 180,
                      width: 180,
                    ),
                  ),
                  Text(
                    'REGISTER',
                    style: poppinsTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1D365A)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: poppinsTextStyle.copyWith(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: poppinsTextStyle.copyWith(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      top: 15,
                      right: 30,
                      bottom: 15,
                    ),
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff1D365A),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          'REGISTER',
                          style: poppinsTextStyle.copyWith(),
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
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: poppinsTextStyle.copyWith(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: Text(
                          'Login',
                          style: poppinsTextStyle.copyWith(
                            color: Color(0xff1D365A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/google_icon.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'assets/icons/facebook_icon.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'assets/icons/microsoft_icon_new.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'assets/icons/apple_icon_new.png',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
