import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';

class OnBoardingButtons extends StatelessWidget {
  final Function() nextFunction, backFunction;
  final int currentIndex;

  const OnBoardingButtons(
      {Key? key,
      required this.nextFunction,
      required this.backFunction,
      required this.currentIndex})
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
            onTap: nextFunction,
            child: CustomAppText(
                text: (currentIndex == 2) ? AppStrings.start : AppStrings.next,
                textSize: 20.sp,
                textWeight: FontWeight.w500,
                textColor: Colors.white)),
        AppSize.h17.ph,
        Visibility(
          visible: currentIndex == 1 || currentIndex == 2,
          child: CustomButton(
              height: AppSize.h45,
              elevation: 10,
              width: 343.w,
              radius: 8,
              background: Colors.white,
              onTap: backFunction,
              child: CustomAppText(
                  text: AppStrings.back,
                  textSize: 20.sp,
                  textWeight: FontWeight.w500,
                  textColor: AppColors.buttonAppColor)),
        )
      ],
    );
  }
}
