import 'package:flutter/material.dart';

import '../theme.dart';

class DividerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      width: 120,
      color: Color(0xffe2ebec),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
