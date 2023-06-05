import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_loading_indicator.dart';
import '../../../../widgets/custom_text.dart';
import '../../cubit/auth_cubit.dart';

class LogOutButtons extends StatelessWidget {
  final Function() noFunction, yesFunction;
  final AuthState state;

  const LogOutButtons(
      {Key? key,
      required this.noFunction,
      required this.yesFunction,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: noFunction,
          child: CustomAppText(
            text: AppStrings.no,
            textColor: AppColors.selectedAppColor,
            textSize: 18.sp,
          ),
        ),
        const Spacer(),
        state is! LogOutLoadedState
            ? InkWell(
                onTap: yesFunction,
                child: CustomAppText(
                  text: AppStrings.yes,
                  textColor: AppColors.errorColor,
                  textSize: 18.sp,
                ),
              )
            : const CustomLoadingIndicator()
      ],
    ).addSymmetricPadding(hVal: AppSize.w30);
  }
}
