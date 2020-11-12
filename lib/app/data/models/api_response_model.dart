class APIResponseModel {
  final String code;
  int status;
  final String message;
  dynamic headers;
  final dynamic data;

  APIResponseModel({
    this.code,
    this.status,
    this.message,
    this.headers,
    this.data,
  });

  factory APIResponseModel.fromJson(Map<String, dynamic> json) =>
      APIResponseModel(
        code: json["code"] ?? "000",
        status: ((json["status"] ?? "error") == "error" ? 400 : 200),
        message: json["message"] ?? "",
        data: json["data"],
      );

  static APIResponseModel onException() => APIResponseModel(
    code: "000",
    status: 400,
    message: "ocorreu um erro. Tente novamente",
    data: null,
  );
}
