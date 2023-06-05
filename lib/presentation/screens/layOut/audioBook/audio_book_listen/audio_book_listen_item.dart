import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';
import '../../../../widgets/custom_text.dart';

class AudioBookListenItem extends StatelessWidget {
  final String title;
  final Function(double) sliderFunction;
  final Function() audioPlayFunction;
  final Duration duration, position;
  final bool isPlaying;

  const AudioBookListenItem(
      {Key? key,
      required this.title,
      required this.sliderFunction,
      required this.duration,
      required this.position,
      required this.isPlaying,
      required this.audioPlayFunction})
      : super(key: key);

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: CustomAppText(
            text: title,
            textSize: 20.sp,
            textWeight: FontWeight.w700,
          ),
          subtitle: CustomAppText(
            text: 'Ernest Hemingway, 1926',
            textWeight: FontWeight.w500,
            textSize: 12.sp,
            textColor: AppColors.secondaryAppColor,
          ),
          trailing: Image.asset(
            AppIcons.favouriteIcon,
            fit: BoxFit.contain,
          ),
        ),
        AppSize.h5.ph,
        Slider(
          min: 0,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: sliderFunction,
          thumbColor: AppColors.buttonAppColor,
          inactiveColor: AppColors.selectedAppColor,
          activeColor: AppColors.buttonAppColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatTime(position)),
            Text(formatTime(duration - position)),
          ],
        ).addSymmetricPadding(hVal: AppSize.w20),
        AppSize.h50.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppIcons.repeatIcon,
              fit: BoxFit.contain,
            ),
            Image.asset(
              AppIcons.skipBack,
              fit: BoxFit.contain,
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.buttonAppColor,
              child: Center(
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 25.r,
                  onPressed: audioPlayFunction,
                  color: Colors.white,
                ),
              ),
            ),
            Image.asset(
              AppIcons.skipForward,
              fit: BoxFit.contain,
            ),
            Image.asset(
              AppIcons.musicIcon,
              fit: BoxFit.contain,
            ),
          ],
        ).addSymmetricPadding(hVal: AppSize.w20),
      ],
    );
  }
}
