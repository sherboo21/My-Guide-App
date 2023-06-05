import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class TermsAndConditionsItem extends StatelessWidget {
  const TermsAndConditionsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppText(
          text: AppStrings.pleaseFollowOurTerms,
          textSize: 32.sp,
          textWeight: FontWeight.w700,
        ),
        AppSize.h35.ph,
        CustomAppText(
          text: AppStrings.thisApp,
          textSize: 16.sp,
          textColor: AppColors.secondaryAppColor,
        ),
        AppSize.h30.ph,
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: CustomAppText(
            text: AppStrings.termsOfUs,
            textAlign: TextAlign.end,
            textWeight: FontWeight.w500,
          ),
        ),
        AppSize.h30.ph,
        CustomAppText(
          text: AppStrings.respectForYourPrivacy,
          textSize: 16.sp,
          textColor: AppColors.secondaryAppColor,
        ),
        AppSize.h30.ph,
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: CustomAppText(
            text: AppStrings.privacyPolicy,
            textAlign: TextAlign.end,
            textWeight: FontWeight.w500,
          ),
        ),
        AppSize.h30.ph,
        CustomAppText(
          text: AppStrings.byClickingIAgree,
          textSize: 16.sp,
          textColor: AppColors.secondaryAppColor,
        ),
      ],
    );
  }
}
