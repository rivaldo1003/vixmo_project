import 'package:flutter/material.dart';
import 'package:vixmo_new/login%20baru%20tgl%209/halaman_login.dart';
import 'package:vixmo_new/theme.dart';

class NewGetStarted extends StatelessWidget {
  const NewGetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                height: MediaQuery.of(context).size.height / 2.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/get_started.png',
                  ),
                )),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Travel by ',
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontWeight: FontWeight.w400,
                              fontSize: 42,
                            )),
                        Text('electric',
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('car ',
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                            )),
                        Text('comfortable',
                            style: TextStyle(
                              fontFamily: 'SanFrancisco',
                              fontSize: 42,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Find out friendly electric car near you '
                      '\nand take care of the environment,'
                      '\ntravel safety',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SanFrancisco',
                        color: Color(0xffBFC2C5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(
          left: 30,
          top: 0,
          right: 30,
          bottom: 30,
        ),
        child: SizedBox(
          height: 50,
          width: 340,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff1D365A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return HalamanLogin();
              }));
            },
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SanFrancisco',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
