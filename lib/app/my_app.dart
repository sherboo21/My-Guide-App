import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/screens/splash/splash_screen.dart';
import 'package:my_guide/presentation/stateMangements/bloc/multi_bloc_providers.dart';
import 'package:my_guide/presentation/stateMangements/cubit/theme_cubit.dart';
import '../config/router/named_router_impl.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProviders.providers(context),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 812),
            builder: (context, child) => MaterialApp(
                // initialRoute: Routes.layOutROUTER,
                onGenerateRoute: NamedNavigatorImpl.onGenerateRoute,
                navigatorKey: NamedNavigatorImpl.navigatorState,
                debugShowCheckedModeBanner: false,
                title: 'My Guide',
                home: const SplashScreen(),
                theme: state),
          );
        },
      ),
    );
  }
}
