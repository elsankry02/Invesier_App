import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home_page/widget/post_card_widget.dart';
import 'package:invesier/features/presentation/home_page/widget/reply_widget.dart';

@RoutePage()
class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k2, ColorManger.k1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              //! PostCardWidget
              PostCardWidget(onTap: () {}),
              SizedBox(height: context.height * 0.012),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    //! ReplyWidget
                    return ReplyWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
