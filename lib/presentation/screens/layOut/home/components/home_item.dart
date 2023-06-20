import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/domain/models/relative_profile.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../config/theme/app_colors.dart';
import '../../../../../utils/app_imgs.dart';
import '../../../../../utils/app_size.dart';
import '../../../../widgets/custom_text.dart';

class HomeItem extends StatelessWidget {
  final RelativeProfileDataModel relativeProfileDataModel;
  const HomeItem({Key? key, required this.relativeProfileDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          relativeProfileDataModel.data!.image ?? 'https://icon-library.com/images/person-png-icon/person-png-icon-29.jpg',
          fit: BoxFit.fill,
          height: 110.h,
          width: 110.w,
        ),
        AppSize.w15.pw,
        SizedBox(
          width: 170.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppText(
                text: relativeProfileDataModel.data!.name!,
                textSize: 16.sp,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                textColor: AppColors.buttonAppColor,
              ),
              CustomAppText(
                text: relativeProfileDataModel.data!.phoneNumber!,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                textColor: AppColors.secondaryAppColor,
                textWeight: FontWeight.w700,
              ),
              CustomAppText(
                text: 'street 9, Maadi, Cairo',
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                textSize: 12.sp,
                textColor: AppColors.secondaryAppColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () async => await launchUrl(Uri(
              scheme: 'tel',
              path: relativeProfileDataModel.data!.phoneNumber,
            )),
            child: Image.asset(
              AppIcons.callIcon,
              fit: BoxFit.contain,
              height: AppSize.h20,
              width: AppSize.w20,
            ),
          ),
        ),
      ],
    );
  }
}
