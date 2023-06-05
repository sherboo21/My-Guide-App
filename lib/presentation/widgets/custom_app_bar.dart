import 'package:flutter/material.dart';
import 'package:my_guide/utils/app_imgs.dart';
import 'package:my_guide/utils/app_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title, leading, trailing, flexibleSpace;
  final double? height;
  final Function()? leadingFunction;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    this.flexibleSpace,
    this.height,
    this.leadingFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: title ?? const SizedBox(),
      flexibleSpace: flexibleSpace ?? const SizedBox(),
      leading: leading ??
          IconButton(
              onPressed: leadingFunction ?? () => Navigator.pop(context),
              icon: Image.asset(
                AppIcons.arrowBackIcon,
                fit: BoxFit.contain,
              )),
      actions: [trailing ?? const SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.maxFinite, height ?? AppSize.h50);
}
