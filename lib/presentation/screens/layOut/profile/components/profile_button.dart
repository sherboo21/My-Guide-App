import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';

class ProfileButton extends StatelessWidget {
  final Function() function;

  const ProfileButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        height: AppSize.h45,
        width: 343.w,
        radius: 8,
        elevation: 10,
        background: AppColors.buttonAppColor,
        onTap: function,
        child: CustomAppText(
            text: AppStrings.save,
            textSize: 20.sp,
            textWeight: FontWeight.w500,
            textColor: Colors.white));
  }
}
