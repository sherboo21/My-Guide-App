import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/data/dataSources/local/notification_helper.dart';
import 'package:my_guide/presentation/screens/useYourLocation/cubit/location_cubit.dart';
import 'package:my_guide/presentation/stateMangements/cubit/internet/internet_cubit.dart';
import 'package:my_guide/presentation/stateMangements/cubit/internet/internet_state.dart';
import 'package:my_guide/utils/app_imgs.dart';

import '../../../config/router/named_router.dart';
import '../../../config/router/named_router_impl.dart';
import '../../../config/theme/app_colors.dart';
import '../../../data/dataSources/local/shared_prefrences.dart';
import '../../../utils/add_premissions.dart';
import '../../../utils/main_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String screen = Routes.onBoardingROUTER;

  getScreen() {
    if (StartPrefs.getLoginValue() == false &&
        StartPrefs.getOnBoardingValue() == false) {
      screen = Routes.onBoardingROUTER;
    } else if (StartPrefs.getLoginValue() == true &&
        StartPrefs.getOnBoardingValue() == true) {
      screen = Routes.layOutROUTER;
    } else if (StartPrefs.getLoginValue() == false &&
        StartPrefs.getOnBoardingValue() == true) {
      screen = Routes.signInROUTER;
    } else {
      screen = Routes.signInROUTER;
    }
  }

  @override
  void initState() {
    super.initState();
    // context.read<LocationCubit>().sendLocation(
    //     lat: StartPrefs.getUserLatValue(), long: StartPrefs.getUserLongValue()
    // );
    AppPermissions().requestNotificationPermission();
    NotificationHelper().getDeviceToken().then((value) {
      debugPrint(value, wrapWidth: 100);
      debugPrint(StartPrefs.getFcmToken(), wrapWidth: 100);
    });
    Timer(const Duration(seconds: 3), () {
      var mNamedNavigator = NamedNavigatorImpl();
      mNamedNavigator.push(screen, replace: true, clean: true);
    });
    getScreen();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is ConnectedState) {
          customNotificationToast(
              context: context,
              content: state.message,
              color: AppColors.buttonAppColor);
        } else if (state is NotConnectedState) {
          customNotificationToast(
              context: context,
              content: state.message,
              color: AppColors.errorColor);
        }
      },
      builder: (context, state) {
        return BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return AnnotatedRegion(
              value: SystemUiOverlayStyle(
                systemNavigationBarColor: StartPrefs.getThemeValue() == false
                    ? Colors.white
                    : AppColors.darkThemeScaffoldColor,
              ),
              child: Scaffold(
                  body: SafeArea(
                child: Center(
                  child: Image.asset(
                    AppIcons.logoIcon,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
            );
          },
        );
      },
    );
  }
}
