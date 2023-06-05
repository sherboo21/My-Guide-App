import 'package:flutter/material.dart';
import 'package:my_guide/presentation/screens/termsAndConditions/components/terms_conditions_buttons.dart';
import 'package:my_guide/presentation/screens/termsAndConditions/components/terms_conditions_item.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
          physics: const BouncingScrollPhysics(),
          children: [
            AppSize.h40.ph,
            const TermsAndConditionsItem(),
            AppSize.h100.ph,
            TermsAndConditionsButtons(
                iAgreeFunction: () {
                  var mNamedNavigator = NamedNavigatorImpl();
                  mNamedNavigator.push(Routes.useYourLocationROUTER,
                      replace: false, clean: false);
                },
                dissAgreeFunction: () {}),
            AppSize.h10.ph,
          ],
        ),
      ),
    );
  }
}
