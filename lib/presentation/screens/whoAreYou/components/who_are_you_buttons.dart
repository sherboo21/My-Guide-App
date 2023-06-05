import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class WhoAreYouButtons extends StatelessWidget {
  final Function() blindFunction, relativeFunction;

  const WhoAreYouButtons(
      {Key? key, required this.blindFunction, required this.relativeFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
            height: AppSize.h45,
            width: 343.w,
            radius: 8,
            elevation: 10,
            background: AppColors.buttonAppColor,
            onTap: blindFunction,
            child: CustomAppText(
                text: AppStrings.blind,
                textSize: 20.sp,
                textWeight: FontWeight.w500,
                textColor: Colors.white)),
        AppSize.h17.ph,
        CustomButton(
            height: AppSize.h45,
            elevation: 10,
            width: 343.w,
            radius: 8,
            background: Colors.white,
            onTap: relativeFunction,
            child: CustomAppText(
                text: AppStrings.relative,
                textSize: 20.sp,
                textWeight: FontWeight.w500,
                textColor: AppColors.buttonAppColor)),
      ],
    );
  }
}
