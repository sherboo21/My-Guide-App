import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/screens/useYourLocation/cubit/location_cubit.dart';
import '../dataSources/remote/app_services.dart';
import '../dataSources/remote/dio.dart';

class LocationRepositoryImpl {
  // send location repository impl //
  Future<dynamic>? sendLocation({
    required void Function(LocationState) emit,
    required LocationState successState,
    loadingState,
    errorState,
    required String lat,
    long,
  }) async {
    emit(loadingState);
    try {
      var data = FormData.fromMap({
        'latitude': lat,
        'longitude': long,
      });
      Response? response = await DioHelper.postData(
        url: AppServices.sendLocationUrl,
        data: data,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
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
