import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_cubit.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';

class ProfileGender extends StatelessWidget {
  final ProfileCubit profileCubit;

  const ProfileGender({Key? key, required this.profileCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppText(
          text: AppStrings.gender,
          textSize: 16.sp,
          textWeight: FontWeight.w500,
          textColor: AppColors.buttonAppColor,
        ),
        AppSize.h10.ph,
        Row(children: [
          Expanded(
            child: Material(
              color: Colors.white,
              elevation: 7,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  Container(
                    height: AppSize.h20,
                    width: AppSize.w20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            profileCubit.profileDataModel.data!.gender == 'MALE'
                                ? AppColors.buttonAppColor
                                : Colors.transparent,
                        border: Border.all(color: AppColors.secondaryAppColor)),
                  ),
                  AppSize.w7.pw,
                  Expanded(
                    child: CustomAppText(
                      text: AppStrings.male,
                      textColor: AppColors.secondaryAppColor,
                    ),
                  )
                ],
              ).addOnlyPadding(
                  tVal: AppSize.h10, bVal: AppSize.h10, lVal: AppSize.w15),
            ),
          ),
          AppSize.w50.pw,
          Expanded(
            child: Material(
              color: Colors.white,
              elevation: 7,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  Container(
                    height: AppSize.h20,
                    width: AppSize.w20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: profileCubit.profileDataModel.data!.gender ==
                                'FEMALE'
                            ? AppColors.buttonAppColor
                            : Colors.transparent,
                        border: Border.all(color: AppColors.secondaryAppColor)),
                  ),
                  AppSize.w7.pw,
                  Expanded(
                    child: CustomAppText(
                      text: AppStrings.female,
                      textColor: AppColors.secondaryAppColor,
                    ),
                  )
                ],
              ).addOnlyPadding(
                  tVal: AppSize.h10, bVal: AppSize.h10, lVal: AppSize.w15),
            ),
          ),
        ])
      ],
    );
  }
}
