import 'package:flutter/cupertino.dart';
import 'package:vixmo_new/theme.dart';

class VerticalDividerCustom extends StatelessWidget {
  const VerticalDividerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 1.5,
      color: greyFont,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
