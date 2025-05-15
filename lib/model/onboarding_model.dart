import 'package:flutter/material.dart';
import 'package:invesier/constant/svg_manger.dart';

class OnboardingModel {
  final String image;
  final String titel;
  final String subTitel;

  OnboardingModel({
    required this.titel,
    required this.subTitel,
    required this.image,
  });
}

List<OnboardingModel> items(BuildContext context) {
  return [
    OnboardingModel(
      titel: 'Welcome to Invesier',
      subTitel:
          'Stay connected with the latest financial news, market trends, and expert insights to keep you informed and ahead.',
      image: SvgManger.kLogo,
    ),
    OnboardingModel(
      titel: 'Practice with Virtual Currency',
      subTitel:
          'Gain experience through simulated trading. No risks, just rewards.',
      image: SvgManger.kLogo,
    ),
    OnboardingModel(
      titel: 'Join Chats & Live Streams',
      subTitel:
          'Talk to experts, join communities, and go live to share your investment journey',
      image: SvgManger.kLogo,
    ),
  ];
}
