import 'package:flutter/material.dart';
import 'package:invesier/constant/string_manger.dart';
import 'package:invesier/router/router.dart';

class Invesier extends StatelessWidget {
  const Invesier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
      theme: ThemeData(fontFamily: StringManger.kManrope),
    );
  }
}
