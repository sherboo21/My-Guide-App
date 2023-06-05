import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../data/dataSources/local/shared_prefrences.dart';
import 'app_imgs.dart';
import 'app_size.dart';

// Show Notification Toast //

customNotificationToast({
  required BuildContext context,
  required String content,
  required Color color,
  Color? textColor,
}) {
  return showToastWidget(
    Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppSize.w30, vertical: AppSize.h10),
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.w10, vertical: AppSize.w15),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              content,
              style:
                  TextStyle(color: textColor ?? Colors.white, fontSize: 14.sp),
            ),
          ),
        ),
      ],
    ),
    context: context,
    isIgnoring: true,
    position: StyledToastPosition.top,
    animation: StyledToastAnimation.slideFromTopFade,
    duration: const Duration(milliseconds: 4000),
  );
}

// Show BottomSheet //

customBottomSheet({
  required BuildContext context,
  required Widget content,
  required ScrollController scrollController,
  required double paddingHorizontal,
  required double paddingVertical,
  required bool isDismissible,
}) {
  return showModalBottomSheet(
    isDismissible: isDismissible,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    )),
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: -AppSize.h10,
                child: SizedBox(
                  width: AppSize.w60,
                  child: Container(
                    height: 7.h,
                    width: AppSize.w60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.buttonAppColor),
                  ),
                )),
            content.addSymmetricPadding(
                hVal: paddingHorizontal, vVal: paddingVertical),
          ],
        ),
      ),
    ),
  );
}

// show alert dialog //

customAlertDialog({
  required BuildContext context,
  required Widget content,
}) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: AppSize.w30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: StartPrefs.getThemeValue() == false
                      ? Colors.white
                      : AppColors.darkThemeScaffoldColor,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSize.h30, horizontal: AppSize.w30),
                        decoration: BoxDecoration(
                          color: AppColors.buttonAppColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        child: Image.asset(
                          AppIcons.logoIcon,
                          fit: BoxFit.contain,
                        ),
                      ),
                      AppSize.h20.ph,
                      content
                    ],
                  ),
                ),
              ),
            ],
          ));
}
