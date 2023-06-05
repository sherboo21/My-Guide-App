import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/audio_book_listen/audio_book_listen_item.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_strings.dart';

import '../../../../../../config/theme/app_colors.dart';
import '../../../../../../utils/app_size.dart';
import '../../../../../widgets/custom_text.dart';

class AudioBookDetailsItem extends StatelessWidget {
  final String image, title, desc, authorAndYear;
  final bool isSelected;
  final Function(double) sliderFunction;
  final Function() audioPlayFunction;
  final Duration duration, position;
  final bool isPlaying;

  const AudioBookDetailsItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.sliderFunction,
      required this.isSelected,
      required this.authorAndYear,
      required this.duration,
      required this.position,
      required this.isPlaying,
      required this.audioPlayFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isSelected,
          child: Column(
            children: [
              CustomAppText(
                text: AppStrings.listeningTo,
                textSize: 24.sp,
                textWeight: FontWeight.w700,
                textColor: AppColors.secondaryAppColor,
                textAlign: TextAlign.center,
              ),
              AppSize.h20.ph
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
            fit: BoxFit.contain,
            height: 271.h,
            width: 271.w,
          ),
        ),
        AppSize.h35.ph,
        Visibility(
            visible: isSelected,
            replacement: Column(
              children: [
                CustomAppText(
                  text: title,
                  textSize: 20.sp,
                  textWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                AppSize.h5.ph,
                CustomAppText(
                  text: authorAndYear,
                  textWeight: FontWeight.w500,
                  textSize: 12.sp,
                  textColor: AppColors.secondaryAppColor,
                  textAlign: TextAlign.center,
                ),
                AppSize.h35.ph,
                CustomAppText(
                  text: desc,
                  textSize: 13.sp,
                  textColor: AppColors.secondaryAppColor,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            child: AudioBookListenItem(
              isPlaying: isPlaying,
              audioPlayFunction: audioPlayFunction,
              title: title,
              sliderFunction: sliderFunction,
              duration: duration,
              position: position,
            ))
      ],
    );
  }
}
