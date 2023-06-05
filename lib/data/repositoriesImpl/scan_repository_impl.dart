import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/screens/scan/cubit/scan_cubit.dart';
import '../dataSources/remote/app_services.dart';
import '../dataSources/remote/dio.dart';

class ScanRepositoryImpl {
  // scan blind id repository impl

  Future<dynamic>? scanBlindId(
      {required void Function(ScanState) emit,
      required ScanState successState,
      loadingState,
      errorState,
      required int id}) async {
    emit(loadingState);
    try {
      Response? response = await DioHelper.postData(
        url: AppServices.scanBlindId,
        data: {'blind_id': id},
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
