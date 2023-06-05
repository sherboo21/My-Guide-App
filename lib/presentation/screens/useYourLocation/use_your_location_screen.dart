import 'package:flutter/material.dart';
import 'package:my_guide/presentation/screens/useYourLocation/components/use_your_location_button.dart';
import 'package:my_guide/presentation/screens/useYourLocation/components/use_your_location_item.dart';
import 'package:my_guide/presentation/widgets/custom_app_bar.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';
import '../../../utils/add_premissions.dart';

class UseYourLocationScreen extends StatefulWidget {
  const UseYourLocationScreen({Key? key}) : super(key: key);

  @override
  State<UseYourLocationScreen> createState() => _UseYourLocationScreenState();
}

class _UseYourLocationScreenState extends State<UseYourLocationScreen> {
  @override
  initState() {
    super.initState();
    AppPermissions.determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppSize.w15),
        children: [
          AppSize.h20.ph,
          const UseYourLocationItem(),
          AppSize.h60.ph,
          UseYourLocationButton(function: () {
            var mNamedNavigator = NamedNavigatorImpl();
            mNamedNavigator.push(Routes.whoAreYouROUTER,
                replace: false, clean: false);
          })
        ],
      ),
    );
  }
}
