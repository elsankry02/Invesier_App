import '../../core/constant/image_manger.dart';

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
    image: ImageManger.kBoyThree,
  ),
  HomeFollowModel(
    title: 'Layla hani',
    subTitle: '@layla_Hai',
    image: ImageManger.kGirlOne,
  ),
  HomeFollowModel(
    title: 'Joe _22',
    subTitle: '@Joee',
    image: ImageManger.kBoyTwo,
  ),
  HomeFollowModel(
    title: 'Mayar Magdy',
    subTitle: '@Mayarr55',
    image: ImageManger.kGirlFour,
  ),
  HomeFollowModel(
    title: 'Jamil ali',
    subTitle: '@j_ali',
    image: ImageManger.kBoyOne,
  ),
  HomeFollowModel(
    title: 'jessi maged',
    subTitle: '@Jess',
    image: ImageManger.kGirlTwo,
  ),
  HomeFollowModel(
    title: 'Haneen ahmed',
    subTitle: '@Haneen_1',
    image: ImageManger.kGirlThree,
  ),
];
