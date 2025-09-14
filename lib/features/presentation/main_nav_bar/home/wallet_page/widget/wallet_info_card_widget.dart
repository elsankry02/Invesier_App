import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';

class WalletInfoCardWidget extends StatelessWidget {
  const WalletInfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.height * 0.016,
        vertical: context.height * 0.020,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.kVector),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.wallet,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.kOceanGreen,
                ),
              ),
              Text(
                "Mohamed Elsankary",
                style: context.kTextTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "12,122.30 ",
                      style: context.kTextTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.kNum,
                      ),
                    ),
                    TextSpan(
                      text: local.invees,
                      style: context.kTextTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.kInvee,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(AppSvgs.kInvesier),
        ],
      ),
    );
  }
}
