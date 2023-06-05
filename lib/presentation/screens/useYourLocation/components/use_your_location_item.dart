import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class UseYourLocationItem extends StatelessWidget {
  const UseYourLocationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppText(
          text: AppStrings.useYourLocation,
          textAlign: TextAlign.center,
          textSize: 32.sp,
          textWeight: FontWeight.w700,
        ),
        AppSize.h30.ph,
        CustomAppText(
          text: AppStrings.allowLocation,
          textAlign: TextAlign.center,
          textSize: 16.sp,
          textColor: AppColors.secondaryAppColor,
        ),
        AppSize.h60.ph,
        Image.asset(
          AppIcons.locationIcon,
          height: 222.h,
          width: 181.64.w,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
