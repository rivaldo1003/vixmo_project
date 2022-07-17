import 'package:flutter/material.dart';

import '../theme.dart';

class LoginBottomSheet extends StatelessWidget {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final String font = 'SanFrancisco';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // height: MediaQuery.of(context).size.height / 1.35,
        height: 530,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xffDAE1E7).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 0,
              ),
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 0,
                top: 40,
                right: 20,
                bottom: 40,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 0,
                        right: 20,
                        bottom: 0,
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
}
