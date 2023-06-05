import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_strings.dart';

class CustomDrawerModel {
  final String image, title;

  CustomDrawerModel({required this.title, required this.image});
}

final List<CustomDrawerModel> drawerItemList = [
  CustomDrawerModel(image: AppIcons.historyIcon, title: AppStrings.history),
  CustomDrawerModel(image: AppIcons.aboutUsIcon, title: AppStrings.aboutUs),
  CustomDrawerModel(image: AppIcons.howItsWork, title: AppStrings.howItWorks),
  CustomDrawerModel(image: AppIcons.settingsIcon, title: AppStrings.settings),
  CustomDrawerModel(image: AppIcons.logOutIcon, title: AppStrings.logOut)
];
