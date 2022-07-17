import 'package:flutter/material.dart';

import 'category.dart';

class MenuConsumption extends StatelessWidget {
  final Category category;

  MenuConsumption(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: category.isActive
          ? Container(
              child: Center(
                child: Text(
                  category.nameCategory,
                  style: TextStyle(
                    color: Colors.white,fontSize: 12,
                  ),
                ),
              ),
              height: 28,
              width: 60,
              decoration: BoxDecoration(
                color: Color(0xff111619),
                borderRadius: BorderRadius.circular(5),
              ),
            )
          : Container(
              child: Center(
                child: Text(
                  category.nameCategory,
                ),
              ),
              height: 28,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
    );
  }
}
