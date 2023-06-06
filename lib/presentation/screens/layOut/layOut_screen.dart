import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/theme/app_colors.dart';
import 'package:my_guide/data/dataSources/local/notification_helper.dart';
import 'package:my_guide/presentation/screens/layOut/gps/gps_screen.dart';
import 'package:my_guide/presentation/screens/layOut/home/home_screen.dart';
import 'package:my_guide/presentation/screens/layOut/profile/profile_screen.dart';
import 'package:my_guide/presentation/stateMangements/cubit/bottom_nav_cubit.dart';
import 'package:my_guide/presentation/widgets/customBottomNavBar/custom_button_nav_bar.dart';

import 'audioBook/audio_book_screen.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  NotificationHelper notificationHelper = NotificationHelper();
  final _pageNavigation = [
    const HomeScreen(),
    const GpsScreen(),
    const AudioBookScreen(),
    const ProfileScreen(),
  ];
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.buttonAppColor,
      ),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          var bottomNavBarCubit = context.read<BottomNavBarCubit>();
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: CustomBottomNavBar(
              bottomNavBarCubit: bottomNavBarCubit,
            ),
            body: _pageNavigation.elementAt(state),
          );
        },
      ),
    );
  }
}
