import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/components_home/bottom_navigation.dart';
import 'package:vixmo_new/login%20baru%20tgl%209/halaman_register.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../theme.dart';

class HalamanLogin extends StatefulWidget {
  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
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

  final String font = 'SanFrancisco';

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
                      controller: _email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF6F8FA),
                        contentPadding: EdgeInsets.all(14),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontFamily: font,
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
                          fontFamily: font,
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
                          'Sign In',
                          style: TextStyle(
                            fontFamily: font,
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
                          fontFamily: font,
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
                        InkWell(
                          onTap: () async {
                            await _handleLogin();
                          },
                          child: buildImage('assets/icons/facebook_icon.png'),
                        ),
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
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return HalamanRegister();
                          }));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: font,
                            color: Color(0xff1D365A),
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
    await _auth.signOut().then((value) => {
          setState(() {
            _facebookLogin.logOut();
            _isLogin = false;
          }),
        });
  }
}
