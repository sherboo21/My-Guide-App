import 'package:flutter/material.dart';
import 'package:my_guide/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../../utils/validaton.dart';
import '../../../../widgets/custom_text_field.dart';

class SignInForm extends StatefulWidget {
  final TextEditingController emailController, passwordController;
  final FocusNode passwordFocusNode;
  final AuthState state;

  const SignInForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.passwordFocusNode,
      required this.state})
      : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: widget.state is LoginErrorState
                      ? AppColors.errorColor
                      : AppColors.buttonAppColor),
              borderRadius: BorderRadius.circular(8)),
          child: CustomTextFormField(
              enabledBorderColor: Colors.transparent,
              focusedBorderColor: Colors.transparent,
              vPadding: AppSize.h22,
              type: TextInputType.emailAddress,
              controller: widget.emailController,
              hint: AppStrings.email,
              prefix: Image.asset(pngIconsName('email')),
              validate: (val) =>
                  validator(val, AppStrings.emailValidation, val!.isEmpty),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(widget.passwordFocusNode);
              }),
        ),
        AppSize.h25.ph,
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: widget.state is LoginErrorState
                      ? AppColors.errorColor
                      : AppColors.buttonAppColor),
              borderRadius: BorderRadius.circular(8)),
          child: CustomTextFormField(
            vPadding: AppSize.h22,
            enabledBorderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
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
        ),
      ],
    );
  }
}
