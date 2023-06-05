import 'package:my_guide/utils/app_imgs.dart';

import '../../../../utils/app_strings.dart';

class OnBoardingModel {
  final String? image;
  final String? title;
  final String? description;

  OnBoardingModel({this.image, this.title, this.description});
}

List<OnBoardingModel> contents = [
  OnBoardingModel(
      image: AppImages.pageImage1,
      title: AppStrings.welcome,
      description: AppStrings.page1Desc),
  OnBoardingModel(
      image: AppImages.pageImage2,
      title: AppStrings.gps,
      description: AppStrings.page2Desc),
  OnBoardingModel(
      image: AppImages.pageImage3,
      title: AppStrings.audioBook,
      description: AppStrings.page3Desc),
];
