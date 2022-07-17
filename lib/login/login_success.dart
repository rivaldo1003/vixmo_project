import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class BackUpLoginGoogle extends StatefulWidget {
  @override
  State<BackUpLoginGoogle> createState() => _BackUpLoginGoogleState();
}

class _BackUpLoginGoogleState extends State<BackUpLoginGoogle> {
  GoogleSignInAccount? _current_user;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _current_user = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _current_user == null
          ? Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () => _handleSignIn(),
            child: Text('Login With Google'),
          ),
        ),
      )
          : Container(
        child: Column(
          children: [
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: _current_user!,
              ),
              title: Text(_current_user!.displayName ?? ''),
              subtitle: Text(_current_user!.email),
            ),
            ElevatedButton(
              onPressed: () {
                _googleSignIn.disconnect();
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
