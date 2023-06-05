import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/cubit/audio_book_cubit.dart';
import 'package:my_guide/presentation/screens/layOut/profile/cubit/profile_cubit.dart';
import 'package:my_guide/presentation/screens/scan/cubit/scan_cubit.dart';
import 'package:my_guide/presentation/screens/useYourLocation/cubit/location_cubit.dart';
import 'package:my_guide/presentation/stateMangements/cubit/app_cubit.dart';
import 'package:my_guide/presentation/stateMangements/cubit/bottom_nav_cubit.dart';
import 'package:my_guide/presentation/stateMangements/cubit/internet/internet_cubit.dart';
import 'package:my_guide/presentation/stateMangements/cubit/theme_cubit.dart';

class MultiBlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<BottomNavBarCubit>(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit()..checkConnection(),
        ),
        BlocProvider<AudioBookCubit>(
          create: (context) => AudioBookCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider<ScanCubit>(
          create: (context) => ScanCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(),
        ),
      ];
}
