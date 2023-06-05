import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../../config/theme/app_colors.dart';
import '../../../../../../utils/app_imgs.dart';
import '../../../../../../utils/app_size.dart';
import '../../../../../../utils/app_strings.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_text.dart';

class AudioBookDetailsButton extends StatelessWidget {
  final Function() function;

  const AudioBookDetailsButton({Key? key, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: AppSize.h40,
      width: 163.w,
      radius: 12,
      background: AppColors.buttonAppColor,
      onTap: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.playIcon,
            fit: BoxFit.contain,
            color: Colors.white,
            height: AppSize.h20,
            width: AppSize.w20,
          ),
          AppSize.w10.pw,
          CustomAppText(
            text: AppStrings.play,
            textSize: 20.sp,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
