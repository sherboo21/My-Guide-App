import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/config/theme/app_text_style.dart';

import '../../utils/app_size.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function()? onTap;
  final dynamic Function(dynamic)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool? isPassword;
  final String? Function(String?)? validate;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final Function()? suffixPressed;
  final bool? isClickable;
  final bool? autocorrect;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final Color? cursorColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final double? hPadding;
  final bool? isEnabled;
  final double? vPadding;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.cursorColor,
    this.hPadding,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.type,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.textStyle,
    this.isPassword,
    this.validate,
    this.hint,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable,
    this.autocorrect,
    this.vPadding,
    this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      style: AppTextStyle(
          textColor: Colors.black,
          textSize: 14.sp,
          textWeight: FontWeight.w400),
      cursorColor: cursorColor ?? AppColors.buttonAppColor,
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: TextStyle(
          color: AppColors.errorColor,
          fontSize: 9.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: hPadding ?? AppSize.w10, vertical: vPadding ?? 0),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: focusedBorderColor ?? AppColors.buttonAppColor)),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: enabledBorderColor ?? const Color(0xFFA5A5A5)),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        hintText: hint,
        hintStyle: textStyle ??
            AppTextStyle(
                textColor: AppColors.buttonAppColor,
                textSize: 14.sp,
                textWeight: FontWeight.w400),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword ?? false,
      enabled: isClickable ?? true,
      focusNode: focusNode,
      onTap: onTap,
      validator: validate,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
