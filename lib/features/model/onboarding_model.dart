import 'package:flutter/material.dart';

import '../../core/constant/app_lotties.dart';
import '../../core/extension/extension.dart';

class OnboardingModel {
  OnboardingModel({
    required this.titel,
    required this.subTitel,
    required this.image,
  });
  final String image, titel, subTitel;
}

List<OnboardingModel> items(BuildContext context) {
  final local = context.kAppLocalizations;
  return [
    OnboardingModel(
      titel: local.welcometoinvesier,
      subTitel:
          local
              .stayconnectedwiththelatestfinancialnewsmarkettrendsandexpertinsightstokeepyouinformedandahead,
      image: AppLotties.kOnboardingOne,
    ),
    OnboardingModel(
      titel: local.practicewithvirtualcurrency,
      subTitel: local.gainexperiencethroughsimulatedtradingnorisksjustrewards,
      image: AppLotties.kOnboardingTwo,
    ),
    OnboardingModel(
      titel: local.joinchatslivestreams,
      subTitel:
          local
              .talktoexpertsjoincommunitiesandgolivetoshareyourinvestmentjourney,
      image: AppLotties.kOnboardingThree,
    ),
  ];
}
