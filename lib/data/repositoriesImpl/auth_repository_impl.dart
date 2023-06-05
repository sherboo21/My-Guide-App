import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/screens/auth/cubit/auth_cubit.dart';
import '../dataSources/local/shared_prefrences.dart';
import '../dataSources/remote/app_services.dart';
import '../dataSources/remote/dio.dart';

class AuthRepositoryImpl {
  // auth register repository Impl //

  Future<dynamic>? register({
    required void Function(AuthState) emit,
    required AuthState successState,
    loadingState,
    errorState,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required int age,
    required String gender,
  }) async {
    emit(loadingState);
    try {
      var data = FormData.fromMap({
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
        'age': age,
        "gender": gender,
        "type": StartPrefs.getUserTypeValue(),
        "fcm_token": StartPrefs.getFcmToken()
      });
      Response? response = await DioHelper.postData(
        url: AppServices.registerUrl,
        data: data,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        StartPrefs.setUserId(response.data['data']['user']['id']);
        StartPrefs.setUserToken(response.data['data']['token']);
        // StartPrefs.setLoginValue(true);
        emit(successState);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }

  // auth log in repository Impl //

  Future<dynamic>? login({
    required void Function(AuthState) emit,
    required AuthState successState,
    loadingState,
    errorState,
    required String email,
    required String password,
  }) async {
    emit(loadingState);
    try {
      var data = FormData.fromMap({
        'email': email,
        'password': password,
        "fcm_token": StartPrefs.getFcmToken()
      });
      Response? response = await DioHelper.postData(
        url: AppServices.logInUrl,
        data: data,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        StartPrefs.setUserToken(response.data['data']['token']);
        StartPrefs.setLoginValue(true);
        emit(successState);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }

  // auth log out repository Impl //

  Future<dynamic>? logOut({
    required void Function(AuthState) emit,
    required AuthState successState,
    loadingState,
    errorState,
  }) async {
    emit(loadingState);
    try {
      Response? response =
          await DioHelper.postData(url: AppServices.logOutUrl, data: {});
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        prefs.remove("user_token");
        StartPrefs.setLoginValue(false);
        emit(successState);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }
}
