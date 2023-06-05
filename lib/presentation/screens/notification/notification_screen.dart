import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_guide/presentation/screens/notification/services.dart';

import '../../../config/theme/app_colors.dart';
import '../../../data/dataSources/local/shared_prefrences.dart';

class NotificationScreen extends StatefulWidget {
  final String? id;
  final String? title;

  const NotificationScreen({Key? key, this.id, this.title}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    // notificationServices.forGroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value) {
      debugPrint(value, wrapWidth: 100);
      debugPrint(StartPrefs.getFcmToken(), wrapWidth: 100);
    });
    notificationServices.isTokenRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: StartPrefs.getThemeValue() == false
              ? Colors.white
              : AppColors.darkThemeScaffoldColor),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ''),
        ),
      ),
    );
  }
}
