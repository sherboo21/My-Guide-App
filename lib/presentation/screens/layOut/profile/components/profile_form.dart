import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';
import '../cubit/profile_cubit.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController fullNameController,
      emailController,
      phoneNumberController,
      ageController;
  final FocusNode emailFocusNode, phoneNumberFocusNode, ageFocusNode;
  final ProfileCubit profileCubit;

  const ProfileForm(
      {Key? key,
      required this.fullNameController,
      required this.emailController,
      required this.phoneNumberController,
      required this.ageController,
      required this.emailFocusNode,
      required this.phoneNumberFocusNode,
      required this.ageFocusNode,
      required this.profileCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppText(
          text: AppStrings.fullName,
          textSize: 16.sp,
          textWeight: FontWeight.w500,
          textColor: AppColors.buttonAppColor,
        ),
        AppSize.h10.ph,
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 7,
          color: Colors.white,
          child: CustomTextFormField(
              type: TextInputType.name,
              enabledBorderColor: Colors.transparent,
              focusedBorderColor: Colors.transparent,
              controller: fullNameController,
              hint: profileCubit.profileDataModel.data!.name,
              textStyle: TextStyle(color: AppColors.secondaryAppColor),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(emailFocusNode);
              }),
        ),
        AppSize.h20.ph,
        CustomAppText(
          text: AppStrings.email,
          textSize: 16.sp,
          textWeight: FontWeight.w500,
          textColor: AppColors.buttonAppColor,
        ),
        AppSize.h10.ph,
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 7,
          color: Colors.white,
          child: CustomTextFormField(
              type: TextInputType.emailAddress,
              enabledBorderColor: Colors.transparent,
              focusedBorderColor: Colors.transparent,
              controller: emailController,
              focusNode: emailFocusNode,
              hint: profileCubit.profileDataModel.data!.email,
              textStyle: TextStyle(color: AppColors.secondaryAppColor),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(phoneNumberFocusNode);
              }),
        ),
        AppSize.h20.ph,
        CustomAppText(
          text: AppStrings.phoneNumber,
          textSize: 16.sp,
          textWeight: FontWeight.w500,
          textColor: AppColors.buttonAppColor,
        ),
        AppSize.h10.ph,
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 7,
          color: Colors.white,
          child: CustomTextFormField(
              type: TextInputType.phone,
              enabledBorderColor: Colors.transparent,
              focusedBorderColor: Colors.transparent,
              controller: phoneNumberController,
              focusNode: phoneNumberFocusNode,
              hint: profileCubit.profileDataModel.data!.phoneNumber,
              textStyle: TextStyle(color: AppColors.secondaryAppColor),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(ageFocusNode);
              }),
        ),
        AppSize.h20.ph,
        CustomAppText(
          text: AppStrings.age,
          textSize: 16.sp,
          textWeight: FontWeight.w500,
          textColor: AppColors.buttonAppColor,
        ),
        AppSize.h10.ph,
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 7,
          color: Colors.white,
          child: CustomTextFormField(
            type: TextInputType.number,
            enabledBorderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            controller: ageController,
            focusNode: ageFocusNode,
            hint: profileCubit.profileDataModel.data!.age.toString(),
            textStyle: TextStyle(color: AppColors.secondaryAppColor),
          ),
        ),
        AppSize.h20.ph,
      ],
    );
  }
}
