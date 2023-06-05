import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';

class SignInItem extends StatelessWidget {
  const SignInItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppText(
          text: AppStrings.signIn,
          textAlign: TextAlign.center,
          textSize: 32.sp,
          textWeight: FontWeight.w700,
        ),
        AppSize.h30.ph,
        Image.asset(
          AppImages.loginImage,
          fit: BoxFit.contain,
          height: 227.h,
          width: 225.w,
        ),
      ],
    );
  }
}
