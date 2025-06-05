import 'package:flutter/material.dart';

extension App on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextTheme get kTextTheme => Theme.of(this).textTheme;
}
