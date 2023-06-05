import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_guide/domain/models/categories.dart';
import 'package:my_guide/presentation/screens/layOut/audioBook/cubit/audio_book_cubit.dart';

import '../../domain/models/book.dart';
import '../../domain/models/book_details.dart';
import '../dataSources/remote/app_services.dart';
import '../dataSources/remote/dio.dart';

class AudioBookRepositoryImpl {
  // get categories repository impl //

  Future<dynamic>? getCategories({
    required void Function(AudioBookState) emit,
    required AudioBookState successState,
    loadingState,
    errorState,
  }) async {
    emit(loadingState);
    try {
      Response? response =
          await DioHelper.getData(url: AppServices.getCategories);
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(successState);
        return CategoriesDataModel.fromJson(response.data);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }

  // get category book impl //

  Future<dynamic>? getCategoryBook(
      {required void Function(AudioBookState) emit,
      required AudioBookState successState,
      loadingState,
      errorState,
      required int id}) async {
    emit(loadingState);
    try {
      Response? response =
          await DioHelper.getData(url: '${AppServices.getCategories}$id/books');
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(successState);
        return BooksDataModel.fromJson(response.data);
      } else {
        emit(errorState);
      }
      return response.data.toString();
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 100);
      emit(errorState);
    }
  }

  // get book details impl //

  Future<dynamic>? getBookDetails(
      {required void Function(AudioBookState) emit,
      required AudioBookState successState,
      loadingState,
      errorState,
      required int id}) async {
    emit(loadingState);
    try {
      Response? response =
          await DioHelper.getData(url: '${AppServices.getBookDetails}$id');
      if (response!.statusCode == 200) {
        debugPrint(response.data.toString(), wrapWidth: 100);
        emit(successState);
        return BookDetailsDataModel.fromJson(response.data);
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
