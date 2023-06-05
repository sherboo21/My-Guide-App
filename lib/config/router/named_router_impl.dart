import 'package:flutter/material.dart';
import 'package:my_guide/presentation/screens/auth/signIn/sign_in_screen.dart';
import 'package:my_guide/presentation/screens/layOut/layOut_screen.dart';
import 'package:my_guide/presentation/screens/onBoarding/on_boarding_screen.dart';
import 'package:my_guide/presentation/screens/scan/scan_screen.dart';
import 'package:my_guide/presentation/screens/splash/splash_screen.dart';
import 'package:my_guide/presentation/screens/termsAndConditions/terms_conditions_screen.dart';
import 'package:my_guide/presentation/screens/useYourLocation/use_your_location_screen.dart';
import 'package:my_guide/presentation/screens/whoAreYou/who_are_you_screen.dart';

import '../../presentation/screens/aboutUs/about_us_screen.dart';
import '../../presentation/screens/auth/signUp/sign_up_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import 'named_router.dart';

class NamedNavigatorImpl implements NamedNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashROUTER:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingROUTER:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.useYourLocationROUTER:
        return MaterialPageRoute(builder: (_) => const UseYourLocationScreen());
      case Routes.termsAndConditionsROUTER:
        return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsScreen());
      case Routes.whoAreYouROUTER:
        return MaterialPageRoute(builder: (_) => const WhoAreYouScreen());
      case Routes.signInROUTER:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUpROUTER:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.scanROUTER:
        return MaterialPageRoute(builder: (_) => const ScanScreen());
      case Routes.layOutROUTER:
        return MaterialPageRoute(builder: (_) => const LayOutScreen());
      case Routes.settingsROUTER:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.aboutUsRouter:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
    }
    return MaterialPageRoute(builder: (_) => Container());
  }

  @override
  void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  @override
  Future push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    }

    if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }

    return navigatorState.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}
