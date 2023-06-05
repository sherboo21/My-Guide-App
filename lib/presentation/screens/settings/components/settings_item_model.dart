import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_strings.dart';

class SettingsItemModel {
  final String icon, title, buttonTitle;

  SettingsItemModel(
      {required this.title, required this.icon, required this.buttonTitle});
}

final List<SettingsItemModel> settingsItemList = [
  SettingsItemModel(
      icon: AppIcons.profileIcon,
      title: AppStrings.account,
      buttonTitle: AppStrings.editProfile),
  SettingsItemModel(
      icon: AppIcons.notificationsIcon,
      title: AppStrings.notifications,
      buttonTitle: AppStrings.notification),
  SettingsItemModel(
      icon: AppIcons.moreIcon,
      title: AppStrings.more,
      buttonTitle: AppStrings.darkMode),
];
