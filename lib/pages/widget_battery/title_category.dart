import 'package:flutter/material.dart';
import 'package:vixmo_new/theme.dart';

import 'category.dart';

class TitleCategory extends StatelessWidget {
  final Category category;

  TitleCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return category.isActive
        ? Text(
            category.nameCategory,
            style: poppinsTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            category.nameCategory,
          );
  }
}
