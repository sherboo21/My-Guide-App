import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/onBoarding/components/on_boarding_model.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../widgets/custom_text.dart';

class OnBoardingItem extends StatelessWidget {
  final int index;

  const OnBoardingItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          contents[index].image!,
          fit: BoxFit.contain,
        ),
        AppSize.h40.ph,
        CustomAppText(
          text: contents[index].title!,
          textAlign: TextAlign.center,
          textSize: 32.sp,
          textWeight: FontWeight.w700,
        ),
        AppSize.h20.ph,
        CustomAppText(
          text: contents[index].description!,
          textAlign: TextAlign.center,
          textSize: 16.sp,
        ),
      ],
    ).addSymmetricPadding(hVal: AppSize.w35);
  }
}
