import 'package:flutter/material.dart';
import 'package:my_guide/presentation/stateMangements/cubit/bottom_nav_cubit.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../config/theme/app_colors.dart';
import '../../../utils/app_size.dart';
import '../custom_text.dart';
import 'components/custom_button_nav_bar_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavBarCubit bottomNavBarCubit;

  const CustomBottomNavBar({Key? key, required this.bottomNavBarCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.h70,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.w30,
      ),
      decoration: BoxDecoration(
          color: AppColors.buttonAppColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: bottomNavItemList
              .asMap()
              .entries
              .map((entry) => InkWell(
                    onTap: () => bottomNavBarCubit.updateIndex(entry.key),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          entry.value.icon,
                          fit: BoxFit.contain,
                          color: (bottomNavBarCubit.state == entry.key)
                              ? AppColors.selectedAppColor
                              : Colors.white,
                        ),
                        AppSize.h10.ph,
                        CustomAppText(
                          text: entry.value.label,
                          textWeight: FontWeight.w500,
                          textColor: (bottomNavBarCubit.state == entry.key)
                              ? AppColors.selectedAppColor
                              : Colors.white,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
