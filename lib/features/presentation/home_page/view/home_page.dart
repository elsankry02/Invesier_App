import 'package:flutter/material.dart';
import 'package:invesier/features/presentation/home_page/widget/invesier_appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(children: [InvesierAppBar()])),
        ],
      ),
    );
  }
}
