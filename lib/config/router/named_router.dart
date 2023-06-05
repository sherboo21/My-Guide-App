class Routes {
  static const splashROUTER = "SPLASH_ROUTER";
  static const onBoardingROUTER = "ONBOARDING_ROUTER";
  static const termsAndConditionsROUTER = "TERMSANDCONDITIONS_ROUTER";
  static const useYourLocationROUTER = "USEYOURLOCATION_ROUTER";
  static const whoAreYouROUTER = "WHOAREYOU_ROUTER";
  static const signInROUTER = "SIGNIN_ROUTER";
  static const signUpROUTER = "SIGNUP_ROUTER";
  static const scanROUTER = "SCAN_ROUTER";
  static const layOutROUTER = "LAYOUT_ROUTER";
  static const settingsROUTER = "SETTINGS_ROUTER";
  static const aboutUsRouter = "ABOUTUS_ROUTER";
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
