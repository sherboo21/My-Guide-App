import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';
import 'package:my_guide/presentation/stateMangements/cubit/theme_cubit.dart';
import 'package:my_guide/presentation/widgets/custom_app_bar.dart';
import 'package:my_guide/presentation/widgets/custom_text.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';
import 'package:my_guide/utils/app_strings.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';
import '../../../config/theme/app_colors.dart';
import 'components/settings_item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationSelected = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: StartPrefs.getThemeValue() == false
            ? Colors.white
            : AppColors.darkThemeScaffoldColor,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          leadingFunction: () {
            var mNamedNavigator = NamedNavigatorImpl();
            mNamedNavigator.push(Routes.layOutROUTER,
                replace: false, clean: false);
          },
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
          children: [
            CustomAppText(
              text: AppStrings.settings,
              textSize: 32.sp,
              textWeight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            AppSize.h45.ph,
            SettingsItem(
              notificationSelected: _notificationSelected,
              themeFunction: (value) {
                setState(() {
                  StartPrefs.getThemeValue() == value;
                  context.read<ThemeCubit>().updateAppTheme();
                });
              },
              notificationFunction: (value) => setState(() {
                _notificationSelected = value;
              }),
            )
          ],
        ),
      ),
    );
  }
}
