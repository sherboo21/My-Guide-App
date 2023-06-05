import 'package:flutter/material.dart';
import 'package:my_guide/presentation/screens/auth/logOut/log_out_alert_dialog.dart';
import 'package:my_guide/utils/app_extentions.dart';

import '../../../../config/router/named_router.dart';
import '../../../../config/router/named_router_impl.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/main_functions.dart';
import '../../custom_button.dart';
import '../../custom_text.dart';
import 'custom_drawer_model.dart';

class CustomDrawerItem extends StatelessWidget {
  final int index;

  CustomDrawerItem({Key? key, required this.index}) : super(key: key);

  final List<Function()> function = [
    () {},
    () {
      var mNamedNavigator = NamedNavigatorImpl();
      mNamedNavigator.push(Routes.aboutUsRouter, replace: false, clean: false);
    },
    () {},
    () {
      var mNamedNavigator = NamedNavigatorImpl();
      mNamedNavigator.push(Routes.settingsROUTER, replace: false, clean: false);
    },
    () {}
  ];

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        elevation: 5,
        height: AppSize.h35,
        background: Colors.white,
        onTap: index == 4
            ? () => customAlertDialog(
                context: context, content: const LogOutAlertDialog())
            : function[index],
        child: Row(
          children: [
            Image.asset(
              drawerItemList[index].image,
              fit: BoxFit.contain,
            ),
            AppSize.w10.pw,
            Expanded(
              child: CustomAppText(
                text: drawerItemList[index].title,
                textWeight: FontWeight.w500,
                textColor: AppColors.buttonAppColor,
              ),
            )
          ],
        ));
  }
}
