import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gestao_usuario/app/data/app_services/locator_service.dart';
import 'package:gestao_usuario/app/data/app_services/navigation_service.dart';
import 'package:gestao_usuario/app/data/app_services/ui_service.dart';
import 'package:gestao_usuario/app/data/dio_settings/dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({
    @required this.requestRetrier,
  });

  @override
  Future onRequest(RequestOptions options) async {
    print("");
    print("requestRetrier.dio.lock()");

    if ((await requestRetrier.connectivity.checkConnectivity()) ==
        ConnectivityResult.none) {
      _showUnexpectedErrorInUI();

      /// requestRetrier.dio.lock();
      /// requestRetrier.dio.lock();
      /// requestRetrier.dio.lock();
      return super.onError(DioError(request: options));
    }
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    // print("requestRetrier?.scheduleRequestRetry(err.request)");
    // print(requestRetrier);

    if (_shouldRetry(err)) {
      try {
        var res = requestRetrier?.scheduleRequestRetry(err.request);
        print("res - - - - - - - - - - - - - - - - ");
        print(res);
      } catch (e) {
        // Let any new error from the retrier pass through
        print("RetryOnConnectionChangeInterceptor error");
        print(e);
        return e;
      }
    }
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.DEFAULT &&
        err.error != null &&
        err.error is SocketException;
  }

  void _showUnexpectedErrorInUI() {
    NavigationService _navigationService = locator<NavigationService>();
    _navigationService.pop();
    UIService.showUIError(message: "Verifique a sua conexão a internet.");
  }
}
