import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/stateMangements/cubit/app_cubit.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../widgets/custom_text.dart';

class AudioBookTabBar extends StatelessWidget {
  final AppCubit appCubit;
  final Function() function;
  final String title;
  final int index;

  const AudioBookTabBar(
      {Key? key,
      required this.appCubit,
      required this.function,
      required this.title,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CustomAppText(
        text: title,
        textColor: appCubit.state == index
            ? AppColors.selectedAppColor
            : AppColors.buttonAppColor,
        textSize: 16.sp,
        textWeight: FontWeight.w700,
      ),
    );
  }
}
