import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vixmo_new/11/start.dart';
import 'package:vixmo_new/components_home/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  Future<Timer> splashScreenStart() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Start();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Shimmer.fromColors(
            baseColor: Color(0xff1772E0),
            highlightColor: Colors.white,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
