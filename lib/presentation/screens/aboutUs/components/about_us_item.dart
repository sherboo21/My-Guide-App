import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../widgets/custom_text.dart';

class AboutUSItem extends StatelessWidget {
  const AboutUSItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.aboutUs,
          fit: BoxFit.contain,
        ),
        AppSize.h30.ph,
        CustomAppText(
          text: 'We are My Guide team from Mansoura University',
          textSize: 20.sp,
          textWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        AppSize.h17.ph,
        CustomAppText(
          text:
              'We hope to make a mutation that helps blind people experience an easier and smoother daily life , and we look forward to being the first project of its kind that makes daily walking for the blind natural and easy.',
          textSize: 18.sp,
          textAlign: TextAlign.center,
        ),
        AppSize.h17.ph,
        CustomAppText(
          text: 'We will continue to develop until we make our own boom.',
          textSize: 18.sp,
          textAlign: TextAlign.center,
        ),
        AppSize.h25.ph,
        CustomAppText(
          text: 'WE WILL MAKE IT EASY.',
          textSize: 20.sp,
          textWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
