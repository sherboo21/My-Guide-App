import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/theme/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (Platform.isAndroid)
          Center(
            child: SpinKitThreeBounce(
              color: AppColors.buttonAppColor,
              size: 20.r,
            ),
          ),
        if (Platform.isIOS)
          CupertinoActivityIndicator(
            radius: 15.r,
            color: AppColors.buttonAppColor,
          )
      ],
    );
  }
}
