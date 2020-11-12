import 'package:gestao_usuario/app/data/app_services/api_base_service.dart';
import 'package:gestao_usuario/app/data/models/api_response_model.dart';

class UserService extends ApiBaseService {
  static const apiUrlEndpoint = "";
  Future<APIResponseModel> getUser() async {
    try {
      final response = await get("$apiUrlEndpoint");

      return response.data;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<APIResponseModel> postUser() async {
    try {
      final response = await post(
        "$apiUrlEndpoint",
      );

      return response.data;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<APIResponseModel> putUser() async {
    try {
      final response = await get("$apiUrlEndpoint");

      return response.data;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<APIResponseModel> pachtUser() async {
    try {
      final response = await patch(
        "$apiUrlEndpoint",
      );
      return response.data;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<APIResponseModel> deleteUser() async {
    try {
      final response = await delete("$apiUrlEndpoint");

      return response.data;
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }
}
