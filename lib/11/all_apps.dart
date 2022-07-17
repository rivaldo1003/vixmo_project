import 'package:flutter/material.dart';
import 'package:vixmo_new/11/widget_home.dart';
import 'package:vixmo_new/theme.dart';

class AllApps extends StatelessWidget {
  const AllApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xffDAE1E7).withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            // alignment: Alignment.topLeft,
            // padding: EdgeInsets.only(
            //   left: 20,
            //   top: 24,
            //   right: 20,
            //   bottom: 30,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 30,
                    right: 20,
                    bottom: 0,
                  ),
                  child: Text(
                    'Control Panel',
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                MenuHomeVixmo(),
              ],
            ),
          ),

          // SizedBox(height: 2),
          // MenuHomeVixmo(),
          // SizedBox(height: 2),
          // MenuHomeVixmo(),
        ],
      ),
    );
  }

  Container buildMenuApps(String title, String img) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF6F8FA),
            ),
            child: Center(
              child: Image.asset(
                img,
                height: 24,
                width: 24,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: font,
              fontWeight: FontWeight.w400,
              color: Color(0xff111619),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
