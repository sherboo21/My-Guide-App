import 'package:my_guide/utils/app_imgs.dart';

import '../../../../utils/app_strings.dart';

class BottomNavBarModel {
  final String icon, label;

  BottomNavBarModel({required this.icon, required this.label});
}

final List<BottomNavBarModel> bottomNavItemList = [
  BottomNavBarModel(icon: AppIcons.homeIcon, label: AppStrings.home),
  BottomNavBarModel(icon: AppIcons.gpsIcon, label: AppStrings.gps),
  BottomNavBarModel(icon: AppIcons.audioIcon, label: AppStrings.audio),
  BottomNavBarModel(icon: AppIcons.profileIcon, label: AppStrings.profile),
];
