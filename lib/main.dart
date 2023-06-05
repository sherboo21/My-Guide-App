import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/presentation/stateMangements/bloc/bloc_observer.dart';

import 'app/my_app.dart';
import 'data/dataSources/local/shared_prefrences.dart';
import 'data/dataSources/remote/dio.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await DioHelper.init();
  await StartPrefs.init();
  debugPrint(StartPrefs.getFcmToken(), wrapWidth: 100);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: StartPrefs.getThemeValue() == false
          ? Brightness.dark
          : Brightness.light));
  return runApp(const MyApp());
}
