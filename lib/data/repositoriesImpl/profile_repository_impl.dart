import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_guide/data/dataSources/remote/app_services.dart';
import 'package:my_guide/domain/models/profile.dart';
import 'package:my_guide/utils/app_strings.dart';

import '../../domain/models/relative_profile.dart';
import '../../presentation/screens/layOut/profile/cubit/profile_state.dart';
import '../dataSources/remote/dio.dart';

class ProfileRepositoryImpl {
  // get profile repository Impl //

  Future<dynamic>? getProfile({
    required void Function(ProfileState) emit,
    required ProfileState successState,
    loadingState,
    errorState,
  }) async {
    emit(loadingState);
    try {
      Response? response = await DioHelper.getData(
        url: AppServices.getProfile,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(successState);
        return ProfileDataModel.fromJson(response.data);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }

  // update profile repository Impl //

  Future<dynamic>? updateProfile({
    required void Function(ProfileState) emit,
    required ProfileState successState,
    loadingState,
    errorState,
    validateState,
    required String name,
    required String email,
    required String phoneNumber,
    required String imagePath,
    required int age,
  }) async {
    emit(loadingState);
    try {
      var data = FormData.fromMap({
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'age': age,
        "image": await MultipartFile.fromFile(imagePath)
      });
      Response? response = await DioHelper.postData(
        url: AppServices.updateProfile,
        data: data,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(successState);
      } else if (response.statusCode != 422) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(validateState);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }
  // get relative profile repository Impl //

  Future<dynamic>? getRelativeProfile({
    required void Function(ProfileState) emit,
  }) async {
    emit(GetRelativeProfileLoadingState());
    try {
      Response? response = await DioHelper.getData(
        url: AppServices.getRelativeProfileUrl,
      );
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(GetRelativeProfileSuccessState(response.data));
        return RelativeProfileDataModel.fromJson(response.data);
      } else {
        emit(GetRelativeProfileErrorState(messageError: AppStrings.anErrorOccurred));
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(GetRelativeProfileErrorState(messageError: e.toString()));
    }
  }
}
