import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/theme/app_theme.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit()
      : super(StartPrefs.getThemeValue() == false
            ? AppTheme.lightThemeData
            : AppTheme.darkThemeData);

  void updateAppTheme() {
    if (state == AppTheme.lightThemeData) {
      StartPrefs.setThemeValue(true);
      emit(AppTheme.darkThemeData);
    } else {
      StartPrefs.setThemeValue(false);
      emit(AppTheme.lightThemeData);
    }
  }
}
