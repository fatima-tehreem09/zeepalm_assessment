import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:zeepalm_assessment/src/util/extensions/string_extension.dart';

class ErrorHandler {
  const ErrorHandler();

  static errorHandler({required Object error}) {
    // internet exceptions
    // handle [Dio] exceptions
    if (error is DioException) {
      if (error.error is SocketException) {
        "Check your internet connection".showToast(ToastType.error);
        throw "Check your internet connection";
      }
      // internet server error
      if (error.response != null) {
        if (error.response!.statusCode == 500) {
          log(error.response.toString());
          log(error.response!.data.toString());
          log(error.error.toString());
          throw "Internal server error";
        } else if (error.response?.statusCode == 400 ||
            error.response?.statusCode == 404) {
          throw error.response?.data['message'] ?? 'Unknown error occurred';
        }
        // handle other status codes
        throw '${error.response?.data['message'] ?? error.response?.statusMessage}';
      }
      // handle other types of exceptions
      throw 'An error occurred: ${error.message}';
    }
    // handle unknown exceptions
    throw 'An unknown error occurred';
  }
}
