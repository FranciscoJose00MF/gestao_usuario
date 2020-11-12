import 'package:dio/dio.dart';
import 'package:gestao_usuario/app/data/models/api_response_model.dart';

class APIResponseModelInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers["Accept"] = "application/json";
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response != null && response.data != null) {
      print("response.data");
      print(response?.data);

      final apiResponseModel = APIResponseModel.fromJson(response.data);
      apiResponseModel.headers = response.headers;

      response.data = apiResponseModel;

      if (apiResponseModel.code == "010") {
        // locator<NavigationService>().navigateToNamedAndReplaceAll(WelcomeViewRoute);
      }
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    print("APIResponseModelInterceptor error");

    // TODO Do this with a certain range of error types
    var response = err.response?.data;
    if (response != null) {
      print("here");
      print(response);
      err.response = Response(
        data: APIResponseModel.fromJson(response),
      );

      return super.onResponse(err.response);
    } else {
      print("no, here");
      err.response = Response(
        data: APIResponseModel.onException(),
      );
    }

    // if(err.type == DioErrorType.CONNECT_TIMEOUT)

    _showUnexpectedErrorInUI();

    return super.onError(err);
  }

  void _showUnexpectedErrorInUI() {
    /*NavigationService _navigationService = locator<NavigationService>();
    _navigationService.pop();
    FailureService.showUIError(
        message: "Ocorreu um erro inesperado. Por favor tente novamente");

     */
  }
}
