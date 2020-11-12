import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gestao_usuario/app/data/models/api_response_model.dart';
import 'package:gestao_usuario/app/utils/const.dart';

class DioService {
  Dio dio;
  static const String ApiUrl = API_URL;

  static DioService getInstance() {
    DioService _instance = DioService();
    _instance.dio = Dio();

    // Set some app level base options
    _setBaseOptionsRequests(_instance.dio);

    // Add interceptors
    _addInterceptors(_instance.dio);

    return _instance;
  }

  Future<Response<APIResponseModel>> post(String url,
      {dynamic body,
      Map<String, dynamic> queryParameters,
      String token}) async {
    return await dio.post<APIResponseModel>(
      "$ApiUrl/$url",
      data: jsonEncode(body),
      queryParameters: queryParameters,
    );
  }

  Future<Response<APIResponseModel>> get(
    String url, {
    Map<String, dynamic> queryParameters,
    int page,
    int limit,
  }) {
    print("url");
    print(url);

    Map<String, dynamic> _queryParameters = queryParameters ?? {};
    Map<String, dynamic> _paginationQueryParameters = (page != null)
        ? {
            "page": page,
            "limit": limit ?? 1000,
          }
        : {};

    print("ApiUrl/$url");
    print("$ApiUrl/$url");

    return dio.get<APIResponseModel>("$ApiUrl/$url", queryParameters: {
      ..._paginationQueryParameters,
      ..._queryParameters,
    });
  }

  Future<Response<APIResponseModel>> put(String url,
      {dynamic body, Map<String, dynamic> queryParameters}) {
    return dio.put<APIResponseModel>("$ApiUrl/$url",
        data: jsonEncode(body), queryParameters: queryParameters);
  }

  Future<Response<APIResponseModel>> patch(String url, {dynamic body}) {
    return dio.patch<APIResponseModel>("$ApiUrl/$url", data: jsonEncode(body));
  }

  Future<Response<APIResponseModel>> delete(String url, {dynamic body}) {
    return dio.delete<APIResponseModel>("$ApiUrl/$url", data: jsonEncode(body));
  }

  static void _setBaseOptionsRequests(Dio dio) {
    dio.options.headers["Content-type"] = "application/json";
    return null;
  }

  static void _addInterceptors(Dio dio) {
    // Add request re-trier interceptor
    /*dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: Connectivity(),
        ),
      ),
    );*/
  }

  setContentType(ContentType contentType) {
    if (contentType == ContentType.FORM_URLENCODED) {
      dio.options.contentType = "application/x-www-form-urlencoded";
    } else if (contentType == ContentType.FORM_DATA) {
      dio.options.contentType = "multipart/form-data";
    } else if (contentType == ContentType.JSON) {
      dio.options.contentType = "application/json";
    }
  }
}

enum ContentType { FORM_URLENCODED, FORM_DATA, JSON }
