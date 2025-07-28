import '../../core/constant/app_images.dart';

class HomeFollowModel {
  final String title, subTitle, image;

  HomeFollowModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<HomeFollowModel> homeFollowModel = [
  HomeFollowModel(
    title: 'Charlie White',
    subTitle: '@charlie_w',
    image: AppImages.kBoyThree,
  ),
  HomeFollowModel(
    title: 'Layla hani',
    subTitle: '@layla_Hai',
    image: AppImages.kGirlOne,
  ),
  HomeFollowModel(
    title: 'Joe _22',
    subTitle: '@Joee',
    image: AppImages.kBoyTwo,
  ),
  HomeFollowModel(
    title: 'Mayar Magdy',
    subTitle: '@Mayarr55',
    image: AppImages.kGirlFour,
  ),
  HomeFollowModel(
    title: 'Jamil ali',
    subTitle: '@j_ali',
    image: AppImages.kBoyOne,
  ),
  HomeFollowModel(
    title: 'jessi maged',
    subTitle: '@Jess',
    image: AppImages.kGirlTwo,
  ),
  HomeFollowModel(
    title: 'Haneen ahmed',
    subTitle: '@Haneen_1',
    image: AppImages.kGirlThree,
  ),
];
