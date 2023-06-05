import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class WhoAreYouItem extends StatelessWidget {
  const WhoAreYouItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.whoAreYou,
          fit: BoxFit.contain,
          height: 236.h,
          width: 240.w,
        ),
        AppSize.h60.ph,
        CustomAppText(
          text: AppStrings.whoAreYou,
          textAlign: TextAlign.center,
          textWeight: FontWeight.w700,
          textSize: 32.sp,
        ),
      ],
    );
  }
}
