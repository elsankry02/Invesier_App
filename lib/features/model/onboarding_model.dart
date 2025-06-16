import 'package:flutter/material.dart';
import '../../core/constant/lottie_manger.dart';

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
          'Stay connected with the latest financial \nnews, market trends, and expert insights \nto keep you informed and ahead.',
      image: LottieManger.kOnboardingOne,
    ),
    OnboardingModel(
      titel: 'Practice with Virtual Currency',
      subTitel:
          'Gain experience through simulated \ntrading. No risks, just rewards.',
      image: LottieManger.kOnboardingTwo,
    ),
    OnboardingModel(
      titel: 'Join Chats & Live Streams',
      subTitel:
          'Talk to experts, join communities, and go \nlive to share your investment journey',
      image: LottieManger.kOnboardingThree,
    ),
  ];
}
