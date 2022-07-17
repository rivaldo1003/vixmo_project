import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vixmo_new/login%20baru%20tgl%209/halaman_login.dart';

class GetStarted extends StatelessWidget {
  final String font = 'SanFrancisco';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 0,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                height: 40,
                width: 40,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium cars. \nEnjoy the luxury',
                    style: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Premium and prestige car hourly rental. \nExperience the thrill at a lower price.',
                    style: TextStyle(
                      fontFamily: font,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffBFC2C5),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 50,
                    width: 280,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff1D365A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return HalamanLogin();
                        }));
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/half_car4.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
