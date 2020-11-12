import 'package:flutter/foundation.dart';
import 'package:gestao_usuario/app/data/app_services/dio_service.dart';

abstract class ApiBaseService {
  DioService _dioService = DioService.getInstance();

  @protected
  post(String url, {dynamic body, Map<String, dynamic> queryParameters}) {
    return _dioService.post(
      url,
      body: body,
      queryParameters: queryParameters,
    );
  }

  @protected
  get(
    String url, {
    Map<String, dynamic> queryParameters,
    int page,
    int limit,
  }) {
    return _dioService.get(url,
        queryParameters: queryParameters, page: page, limit: limit);
  }

  @protected
  put(
    String url, {
    dynamic body,
    Map<String, dynamic> queryParameters,
  }) {
    return _dioService.put(url, body: body, queryParameters: queryParameters);
  }

  @protected
  patch(String url, {dynamic body}) {
    return _dioService.patch(url, body: body);
  }

  @protected
  delete(String url, {dynamic body}) {
    return _dioService.delete(url, body: body);
  }
}
