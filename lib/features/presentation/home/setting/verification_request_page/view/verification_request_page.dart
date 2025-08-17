import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_appbar_widget.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/core/extension/extension.dart';

@RoutePage()
class VerificationRequestPage extends StatelessWidget {
  const VerificationRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              CustomAppBarWidget(title: "verification request"),
              SizedBox(height: context.height * 0.035),
            ],
          ),
        ),
      ),
    );
  }
}
