import 'package:flutter/material.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';
import 'package:my_guide/presentation/screens/whoAreYou/components/who_are_you_buttons.dart';
import 'package:my_guide/presentation/screens/whoAreYou/components/who_are_you_item.dart';
import 'package:my_guide/presentation/widgets/custom_app_bar.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';

class WhoAreYouScreen extends StatefulWidget {
  const WhoAreYouScreen({Key? key}) : super(key: key);

  @override
  State<WhoAreYouScreen> createState() => _WhoAreYouScreenState();
}

class _WhoAreYouScreenState extends State<WhoAreYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSize.w20),
        children: [
          AppSize.h30.ph,
          const WhoAreYouItem(),
          AppSize.h70.ph,
          AppSize.h40.ph,
          WhoAreYouButtons(blindFunction: () {
            prefs.remove('user_type_value');
            StartPrefs.setUserTypeValue('BLIND');
            var mNamedNavigator = NamedNavigatorImpl();
            mNamedNavigator.push(Routes.signUpROUTER,
                replace: false, clean: false);
          }, relativeFunction: () {
            prefs.remove('user_type_value');
            StartPrefs.setUserTypeValue('RELATIVE');
            var mNamedNavigator = NamedNavigatorImpl();
            mNamedNavigator.push(Routes.signUpROUTER,
                replace: false, clean: false);
          }),
          AppSize.h10.ph,
        ],
      ),
    );
  }
}
