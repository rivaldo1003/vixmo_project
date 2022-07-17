import 'package:flutter/material.dart';
import 'package:vixmo_new/theme.dart';

class ShowBottomSheetNotif extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16),
                  height: 6,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Color(0xffDAE1E7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Car Information Service',
                        style: poppinsTextStyle.copyWith(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
