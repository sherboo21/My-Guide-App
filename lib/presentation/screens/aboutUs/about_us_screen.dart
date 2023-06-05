import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/aboutUs/components/about_us_item.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../config/theme/app_colors.dart';
import '../../../data/dataSources/local/shared_prefrences.dart';
import '../../../utils/app_strings.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: StartPrefs.getThemeValue() == false
              ? Colors.white
              : AppColors.darkThemeScaffoldColor,
        ),
        child: Scaffold(
          appBar: CustomAppBar(leadingFunction: () => Navigator.pop(context)),
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppSize.w25),
            children: [
              CustomAppText(
                text: AppStrings.aboutUs,
                textSize: 32.sp,
                textWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              AppSize.h30.ph,
              const AboutUSItem(),
              AppSize.h10.ph,
            ],
          ),
        ));
  }
}
