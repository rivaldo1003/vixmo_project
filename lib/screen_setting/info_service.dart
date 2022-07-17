import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InfoService extends StatelessWidget {
  const InfoService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text('Basic Alert'),
                onPressed: () => _onBasicAlertPressed(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();
  }
}
