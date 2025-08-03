import '../../core/constant/app_images.dart';

class FollowModel {
  final String title, subTitle, image;

  FollowModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<FollowModel> homeFollowModel = [
  FollowModel(
    title: 'Charlie White',
    subTitle: '@charlie_w',
    image: AppImages.kBoyThree,
  ),
  FollowModel(
    title: 'Layla hani',
    subTitle: '@layla_Hai',
    image: AppImages.kGirlOne,
  ),
  FollowModel(title: 'Joe _22', subTitle: '@Joee', image: AppImages.kBoyTwo),
  FollowModel(
    title: 'Mayar Magdy',
    subTitle: '@Mayarr55',
    image: AppImages.kGirlFour,
  ),
  FollowModel(title: 'Jamil ali', subTitle: '@j_ali', image: AppImages.kBoyOne),
  FollowModel(
    title: 'jessi maged',
    subTitle: '@Jess',
    image: AppImages.kGirlTwo,
  ),
  FollowModel(
    title: 'Haneen ahmed',
    subTitle: '@Haneen_1',
    image: AppImages.kGirlThree,
  ),
];
