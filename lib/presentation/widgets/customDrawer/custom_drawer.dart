import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/presentation/widgets/customDrawer/components/custom_drawer_item.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_imgs.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../data/dataSources/local/shared_prefrences.dart';
import 'components/custom_drawer_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(25),
            ),
            color: StartPrefs.getThemeValue() == false
                ? Colors.white
                : AppColors.darkThemeScaffoldColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  AppIcons.closeIcon,
                  fit: BoxFit.contain,
                  height: AppSize.h48,
                  width: AppSize.w48,
                ),
              ),
            ),
            AppSize.h30.ph,
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages.personImage,
                    fit: BoxFit.contain,
                    height: AppSize.h85,
                    width: AppSize.w85,
                  ),
                ),
                AppSize.w10.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppText(
                        text: 'Toni Charles',
                        textColor: AppColors.buttonAppColor,
                        textWeight: FontWeight.w500,
                      ),
                      CustomAppText(
                        text: 'toncharles@gmail.com',
                        textColor: AppColors.secondaryAppColor,
                        textSize: 12.sp,
                      ),
                    ],
                  ),
                )
              ],
            ),
            AppSize.h15.ph,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drawerItemList.length,
              itemBuilder: (context, index) => CustomDrawerItem(
                index: index,
              ).addOnlyPadding(rVal: index == 4 ? 150 : AppSize.w40),
              separatorBuilder: (context, index) =>
                  index == 3 ? AppSize.h55.ph : AppSize.h25.ph,
            )
          ],
        ).addSymmetricPadding(hVal: AppSize.w10, vVal: AppSize.h40),
      ),
    );
  }
}
