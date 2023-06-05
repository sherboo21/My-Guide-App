import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class ScanItem extends StatelessWidget {
  const ScanItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppText(
          text: AppStrings.scanQrCode,
          textSize: 32.sp,
          textAlign: TextAlign.center,
          textWeight: FontWeight.w700,
        ),
        AppSize.h15.ph,
        CustomAppText(
          text: AppStrings.placeTheQrCodeInsideTheArea,
          textSize: 16.sp,
          textAlign: TextAlign.center,
        ),
        AppSize.h5.ph,
        CustomAppText(
          text: AppStrings.scanningWillStartAutomatically,
          textColor: AppColors.secondaryAppColor,
          textAlign: TextAlign.center,
          textSize: 12.sp,
        ),
      ],
    );
  }
}
