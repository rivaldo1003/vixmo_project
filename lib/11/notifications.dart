import 'package:flutter/material.dart';

import '../theme.dart';

class NotificationsVixmo extends StatefulWidget {
  const NotificationsVixmo({Key? key}) : super(key: key);

  @override
  State<NotificationsVixmo> createState() => _NotificationsVixmoState();
}

class _NotificationsVixmoState extends State<NotificationsVixmo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/icons_home/arrow_left.png',
            height: 24,
            width: 24,
            scale: 4,
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: font,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff111619),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            buildNotifications(),
            SizedBox(height: 16),
            Divider(thickness: 2, color: greyFix),
            buildNotifications(),
            SizedBox(height: 16),
            Divider(thickness: 2, color: greyFix),
            buildNotifications(),
            SizedBox(height: 16),
            Divider(thickness: 2, color: greyFix),
            buildNotifications(),
            SizedBox(height: 16),
            Divider(thickness: 2, color: greyFix),
            buildNotifications(),
            SizedBox(height: 16),
            Divider(thickness: 2, color: greyFix),
            buildNotifications(),
            SizedBox(height: 16),
            Divider(thickness: 2, color: greyFix),
          ],
        ),
      ),
    );
  }

  Container buildNotifications() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
        bottom: 0,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/icons_notif/warning_notif.png',
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service Information',
                style: TextStyle(
                  fontFamily: font,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff111619),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Please service your car on time',
                style: TextStyle(
                  fontFamily: font,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '1 Jam',
                  style: TextStyle(
                    fontFamily: font,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
