import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/settings/components/settings_item_model.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../data/dataSources/local/shared_prefrences.dart';
import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class SettingsItem extends StatelessWidget {
  final Function(bool) themeFunction, notificationFunction;
  final bool notificationSelected;

  const SettingsItem(
      {Key? key,
      required this.themeFunction,
      required this.notificationFunction,
      required this.notificationSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: settingsItemList
              .asMap()
              .entries
              .map((entries) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            entries.value.icon,
                            fit: BoxFit.contain,
                            color: AppColors.buttonAppColor,
                          ),
                          AppSize.w12.pw,
                          Expanded(
                            child: CustomAppText(
                              text: entries.value.title,
                              textSize: 20.sp,
                              textWeight: FontWeight.w600,
                              textColor: AppColors.buttonAppColor,
                            ),
                          ),
                        ],
                      ),
                      AppSize.h10.ph,
                      const Divider(
                        color: Color(0xFFD9D9D9),
                        thickness: 2,
                      ),
                      AppSize.h10.ph,
                      CustomButton(
                        height: AppSize.h35,
                        width: 239.w,
                        radius: 8,
                        background: Colors.white,
                        elevation: 7,
                        onTap: () {},
                        child: Row(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: CustomAppText(
                                text: entries.value.buttonTitle,
                                textColor: AppColors.buttonAppColor,
                                textWeight: FontWeight.w500,
                              ),
                            ),
                            AppSize.w70.pw,
                            Expanded(
                              child: Visibility(
                                visible: entries.key == 1 || entries.key == 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Visibility(
                                        visible: entries.key == 1,
                                        replacement: CustomAppText(
                                          text: StartPrefs.getThemeValue()
                                              ? AppStrings.on
                                              : AppStrings.off,
                                          textColor: AppColors.buttonAppColor,
                                          textSize: 12.sp,
                                        ),
                                        child: CustomAppText(
                                          text: notificationSelected
                                              ? AppStrings.on
                                              : AppStrings.off,
                                          textColor: AppColors.buttonAppColor,
                                          textSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Switch(
                                          thumbColor: MaterialStateProperty.all(
                                              AppColors.buttonAppColor),
                                          trackColor: MaterialStateProperty.all(
                                              const Color(0xFFD9D9D9)),
                                          value: entries.key == 1
                                              ? notificationSelected
                                              : StartPrefs.getThemeValue(),
                                          onChanged: entries.key == 1
                                              ? notificationFunction
                                              : themeFunction),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      AppSize.h40.ph,
                    ],
                  ))
              .toList(),
        ),
        AppSize.h60.ph,
        CustomButton(
          height: AppSize.h35,
          width: 132.w,
          radius: 8,
          background: Colors.white,
          elevation: 7,
          onTap: () {},
          child: Row(
            children: [
              Image.asset(
                AppIcons.logOutIcon,
                fit: BoxFit.contain,
              ),
              AppSize.w10.pw,
              Expanded(
                child: CustomAppText(
                  text: AppStrings.logOut,
                  textColor: AppColors.buttonAppColor,
                  textWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
