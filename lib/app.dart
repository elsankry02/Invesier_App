import 'package:flutter/material.dart';
import 'package:invesier/constant/string_manger.dart';

class Invesier extends StatelessWidget {
  const Invesier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(fontFamily: StringManger.kManrope));
  }
}
