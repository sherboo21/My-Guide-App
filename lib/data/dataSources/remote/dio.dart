import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';

import 'app_exceptions.dart';
import 'app_services.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppServices.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  // Get Function //

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${StartPrefs.getUserToken()}',
      };
      return await dio.get(url, queryParameters: params);
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioError catch (e) {
      debugPrint(e.message.toString(), wrapWidth: 100);
      debugPrint(e.response.toString(), wrapWidth: 100);
      String errorMsg = _returnResponse(e.response!);
      debugPrint(errorMsg, wrapWidth: 100);
    }
    return null;
  }

  // Post Function //

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? params,
    required dynamic data,
  }) async {
    try {
      return await dio.post(url,
          data: data,
          queryParameters: params,
          options: Options(
              followRedirects: false,
              //Will Not Throw Errors
              validateStatus: (status) => true,
              headers: {
                'Authorization': 'Bearer ${StartPrefs.getUserToken()}',
              }));
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioError catch (e) {
      debugPrint(e.message.toString(), wrapWidth: 100);
      debugPrint(e.response.toString(), wrapWidth: 100);
      String errorMsg = _returnResponse(e.response!);
      debugPrint(errorMsg, wrapWidth: 100);
    }
    return null;
  }

  // Delete Function //

  static Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${StartPrefs.getUserToken()}',
      };
      return await dio.delete(url, queryParameters: params);
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioError catch (e) {
      debugPrint(e.message.toString(), wrapWidth: 100);
      debugPrint(e.response.toString(), wrapWidth: 100);
      String errorMsg = _returnResponse(e.response!);
      debugPrint(errorMsg, wrapWidth: 100);
    }
    return null;
  }

// Put Function //

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? params,
    required dynamic data,
  }) async {
    try {
      return await dio.put(url,
          data: data,
          queryParameters: params,
          options: Options(
              followRedirects: false,
              //Will Not Throw Errors
              validateStatus: (status) => true,
              headers: {
                'Authorization': 'Bearer ${StartPrefs.getUserToken()}',
              }));
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioError catch (e) {
      debugPrint(e.message.toString(), wrapWidth: 100);
      debugPrint(e.response.toString(), wrapWidth: 100);
      String errorMsg = _returnResponse(e.response!);
      debugPrint(errorMsg, wrapWidth: 100);
    }
    return null;
  }

  // function to handle response //

  static dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.data.toString());
        return responseJson;
      case 400:
        throw returnErrors(response);
      case 422:
        throw AppExceptions('Error occurred while Communication');
      case 401:
      case 403:
      case 404:
        throw AppExceptions(
            "The email or password you've entered is incorrect");
      case 500:
      default:
        throw AppExceptions('Error occurred while Communication');
    }
  }
}
