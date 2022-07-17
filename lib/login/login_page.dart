import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vixmo_new/components_home/bottom_navigation.dart';
import 'package:vixmo_new/login/register_page.dart';
import 'package:vixmo_new/theme.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xffA0ACBC),
        body: !_isLogin
            ? GestureDetector(
                onTap: () =>
                    FocusScope.of(context).requestFocus(new FocusNode()),
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
                            'LOGIN',
                            style: poppinsTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1D365A)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 30, top: 0, right: 30, bottom: 0),
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
                            margin: EdgeInsets.only(
                                left: 30, top: 0, right: 30, bottom: 0),
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  'LOGIN',
                                  style: poppinsTextStyle.copyWith(),
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
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: poppinsTextStyle.copyWith(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return RegisterPage();
                                  }));
                                },
                                child: Text(
                                  'Register',
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
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await _handleLogin();
                                  },
                                  child: Image.asset(
                                    'assets/icons/facebook_icon.png',
                                    height: 30,
                                    width: 30,
                                  ),
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
              )
            : BottomNavigationHomePage(),
      ),
    );
  }

  void showNotif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
        ),
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
