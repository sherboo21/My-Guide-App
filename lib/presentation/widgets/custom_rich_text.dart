import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/config/theme/app_text_style.dart';

class CustomAppRichText extends StatelessWidget {
  final String text1, text2;
  final Function()? text1Function, text2Function;
  final double? text1Size, text2Size;
  final FontWeight? text1Weight, text2Weight;
  final Color? text1Color, text2color;

  const CustomAppRichText(
      {Key? key,
      required this.text1,
      required this.text2,
      this.text1Function,
      this.text2Function,
      this.text1Size,
      this.text2Size,
      this.text1Weight,
      this.text2Weight,
      this.text1Color,
      this.text2color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text1,
          style: AppTextStyle(
              textColor: text1Color ?? AppColors.textPPColor,
              textSize: text1Size ?? 13.sp,
              textWeight: text1Weight ?? FontWeight.w400),
          recognizer: TapGestureRecognizer()..onTap = text1Function ?? () {},
          children: [
            TextSpan(
                text: text2,
                style: AppTextStyle(
                    textColor: text2color ?? AppColors.textPPColor,
                    textSize: text2Size ?? 13.sp,
                    textWeight: text2Weight ?? FontWeight.w400),
                recognizer: TapGestureRecognizer()
                  ..onTap = text2Function ?? () {})
          ]),
    );
  }
}
