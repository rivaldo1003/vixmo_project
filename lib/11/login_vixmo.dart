import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/11/register_vixmo.dart';
import 'package:vixmo_new/theme.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import '../components_home/bottom_navigation.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LoginVixmo extends StatefulWidget {
  @override
  State<LoginVixmo> createState() => _LoginVixmoState();
}

class _LoginVixmoState extends State<LoginVixmo> {
  final String font = 'SanFrancisco';
  Color colorFontGrey = Color(0xff888FA6);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return BottomNavigationHomePage();
      }));
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShow = false;
  bool isEmail = false;
  int? minLength;
  bool _obscureText = true;

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
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Login',
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
                        'Hello again, you\'ve missed! ',
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
                        child: TextFormField(
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
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'required';
                            }

                            if (!val.contains('@') || !val.contains('.')) {
                              return 'Invalid email';
                            } else {}
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: [
                          Container(
                            child: TextFormField(
                              obscureText: _obscureText,
                              controller: _password,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF6F8FA),
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
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'required';
                                }
                                // if (val.length != 6) {
                                //   return 'You must enter the password  6 digit or more';
                                // } else {}
                                return null;
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: !_obscureText
                                  ? Icon(
                                      Icons.visibility,
                                      color: greyFont,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: greyFont,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Lupa Password?',
                          style: poppinsTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                              'Sign In',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) return;
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
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
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
                            GestureDetector(
                              onTap: () async {
                                _handleLogin();
                              },
                              child:
                                  buildImage('assets/icons/facebook_icon.png'),
                            ),
                            SizedBox(width: 40),
                            InkWell(
                              onTap: () async {
                                await performLogin(
                                    "microsoft.com",
                                    ["email openid"],
                                    {'tenant': 'Add tour Tent'});
                              },
                              child:
                                  buildImage('assets/icons/microsoft_icon.png'),
                            ),
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
                        'Don\'t have an account? ',
                        style: poppinsTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return RegisterVixmo();
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

  Future _handleLogin() async {
    FacebookLoginResult _result = await _facebookLogin.logIn();
    switch (_result.status) {
      case FacebookLoginStatus.cancel:
        print('cancelledByUser');
        break;
      case FacebookLoginStatus.error:
        print('error');
        break;
      case FacebookLoginStatus.success:
        await _loginWithFacebook(_result);
        break;
      default:
    }
  }

  Future _loginWithFacebook(FacebookLoginResult _result) async {
    FacebookAccessToken? _accessToken = _result.accessToken;
    AuthCredential _credential =
        FacebookAuthProvider.credential(_accessToken!.token);
    var a = await _auth.signInWithCredential(_credential);
    setState(() {
      _isLogin = true;
      _user = a.user;
    });
  }

  Future signOut() async {
    await _auth.signOut().then(
          (value) => {
            setState(() {
              _facebookLogin.logOut();
              _isLogin = false;
            }),
          },
        );
  }
}
