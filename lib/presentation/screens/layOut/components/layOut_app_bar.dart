import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../utils/app_imgs.dart';
import '../../../../utils/app_size.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text.dart';

class LayOutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing, leading;

  const LayOutAppBar(
      {Key? key, required this.title, this.trailing, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
            leading: leading ??
                InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Image.asset(
                    AppIcons.drawerIcon,
                    fit: BoxFit.contain,
                  ),
                ),
            title: CustomAppText(
              text: title,
              textWeight: FontWeight.w700,
              textSize: 24.sp,
            ),
            trailing: trailing ?? const SizedBox())
        .addOnlyPadding(tVal: AppSize.h20);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, AppSize.h80);
}
