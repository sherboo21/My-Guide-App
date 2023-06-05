import 'package:flutter/material.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/presentation/screens/onBoarding/components/on_boarding_buttons.dart';
import 'package:my_guide/utils/app_extentions.dart';
import 'package:my_guide/utils/app_size.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';
import '../../../data/dataSources/local/shared_prefrences.dart';
import '../../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';
import 'components/on_boarding_item.dart';
import 'components/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppSize.h30.ph,
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: () {},
                child: CustomAppText(
                    text: AppStrings.skip,
                    textAlign: TextAlign.end,
                    textColor: AppColors.buttonAppColor),
              ),
            ),
            AppSize.h40.ph,
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardingItem(index: index),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => buildIndicator(index, context),
              ),
            ),
            OnBoardingButtons(
              currentIndex: _currentIndex,
              nextFunction: () {
                if (_currentIndex == 2) {
                  StartPrefs.setOnBoardingValue(true);
                  var mNamedNavigator = NamedNavigatorImpl();
                  mNamedNavigator.push(Routes.termsAndConditionsROUTER,
                      replace: true, clean: true);
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              backFunction: () => _controller.jumpToPage(_currentIndex - 1),
            ),
            AppSize.h20.ph,
          ],
        ).addSymmetricPadding(hVal: AppSize.w25),
      ),
    );
  }

  Widget buildIndicator(int index, context) {
    return Container(
      height: AppSize.h7,
      width: _currentIndex == index ? AppSize.w25 : AppSize.w7,
      margin:
          EdgeInsets.symmetric(horizontal: AppSize.w2, vertical: AppSize.h40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _currentIndex == index
              ? AppColors.buttonAppColor
              : const Color(0XFFD9D9D9)),
    );
  }
}
