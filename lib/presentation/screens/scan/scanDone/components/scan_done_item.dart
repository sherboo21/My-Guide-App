import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/scan/scanDone/components/scan_done_button.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';

class ScanDoneItem extends StatelessWidget {
  final Function() function;

  const ScanDoneItem({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSize.h20.ph,
        CustomAppText(
          text: AppStrings.scanDone,
          textSize: 32.sp,
          textWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        AppSize.h20.ph,
        Material(
          elevation: 15,
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: Container(
            height: 220.h,
            width: 220.w,
            decoration: BoxDecoration(
                color: AppColors.buttonAppColor, shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                AppIcons.scanDoneIcon,
                fit: BoxFit.cover,
                color: Colors.white,
                height: 170.h,
                width: 170.w,
              ),
            ),
          ),
        ),
        AppSize.h40.ph,
        ScanDoneButton(function: function)
      ],
    );
  }
}
