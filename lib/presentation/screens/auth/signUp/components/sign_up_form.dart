import 'package:flutter/material.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/validaton.dart';
import '../../../../widgets/custom_text_field.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController fullNameController,
      emailController,
      genderController,
      ageController,
      phoneNumberController,
      passwordController;
  final FocusNode emailFocusNode,
      genderFocusNode,
      ageFocusNode,
      phoneNumberFocusNode,
      passwordFocusNode;

  const SignUpForm(
      {Key? key,
      required this.fullNameController,
      required this.emailController,
      required this.genderController,
      required this.ageController,
      required this.phoneNumberController,
      required this.passwordController,
      required this.emailFocusNode,
      required this.genderFocusNode,
      required this.ageFocusNode,
      required this.phoneNumberFocusNode,
      required this.passwordFocusNode})
      : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            vPadding: AppSize.h22,
            type: TextInputType.name,
            controller: widget.fullNameController,
            hint: AppStrings.fullName,
            prefix: Image.asset(
              pngIconsName('fullName'),
            ),
            validate: (val) =>
                validator(val, AppStrings.fullNameValidation, val!.isEmpty),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.emailFocusNode);
            }),
        AppSize.h17.ph,
        CustomTextFormField(
            vPadding: AppSize.h22,
            type: TextInputType.emailAddress,
            controller: widget.emailController,
            focusNode: widget.emailFocusNode,
            hint: AppStrings.email,
            prefix: Image.asset(pngIconsName('email')),
            validate: (val) => validator(
                val,
                AppStrings.emailValidation,
                val!.isEmpty ||
                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(val)),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.genderFocusNode);
            }),
        AppSize.h17.ph,
        CustomTextFormField(
            vPadding: AppSize.h22,
            type: TextInputType.text,
            controller: widget.genderController,
            hint: AppStrings.gender,
            focusNode: widget.genderFocusNode,
            prefix: Image.asset(pngIconsName('gender')),
            validate: (val) =>
                validator(val, AppStrings.genderValidation, val!.isEmpty),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.ageFocusNode);
            }),
        AppSize.h17.ph,
        CustomTextFormField(
            vPadding: AppSize.h22,
            type: TextInputType.number,
            controller: widget.ageController,
            focusNode: widget.ageFocusNode,
            hint: AppStrings.age,
            prefix: Image.asset(pngIconsName('age')),
            validate: (val) =>
                validator(val, AppStrings.ageValidation, val!.isEmpty),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.phoneNumberFocusNode);
            }),
        AppSize.h17.ph,
        CustomTextFormField(
            vPadding: AppSize.h22,
            type: TextInputType.phone,
            controller: widget.phoneNumberController,
            hint: AppStrings.phoneNumber,
            focusNode: widget.phoneNumberFocusNode,
            prefix: Image.asset(pngIconsName('phoneNumber')),
            validate: (val) => validator(val, AppStrings.phoneNumberValidation,
                val!.isEmpty || val.length < 11),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(widget.passwordFocusNode);
            }),
        AppSize.h17.ph,
        CustomTextFormField(
          vPadding: AppSize.h22,
          type: TextInputType.visiblePassword,
          controller: widget.passwordController,
          focusNode: widget.passwordFocusNode,
          hint: AppStrings.password,
          isPassword: _isObscure ? false : true,
          suffix: IconButton(
            onPressed: () => setState(
              () {
                if (_isObscure) {
                  _isObscure = false;
                } else {
                  _isObscure = true;
                }
              },
            ),
            icon: Icon(
              _isObscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: _isObscure
                  ? AppColors.buttonAppColor
                  : const Color(0xFFA5A5A5),
            ),
          ),
          prefix: Image.asset(pngIconsName('password')),
          validate: (val) => validator(val, AppStrings.passwordValidation,
              val!.isEmpty || val.length < 6),
        ),
      ],
    );
  }
}
