class ApiHttpResponse {
  String? message, responceString, token;
  String? processStatus, status;
  int? responseCode, apiStatus;
  bool? success;
  ApiHttpResponse({
    this.responseCode,
    this.responceString,
    this.message,
    this.token,
    this.processStatus,
    this.success,
    this.status,
  });

  ApiHttpResponse.fromJSON(Map<String, dynamic> jsonMap)
      : status = jsonMap['status_code'],
        apiStatus = jsonMap['status'],
        processStatus = jsonMap['process_status'],
        success = jsonMap['success'],
        message = jsonMap['message'];

  ApiHttpResponse.fromJSONLogin(Map<String, dynamic> jsonMap)
      : token = jsonMap['token'],
        apiStatus = jsonMap['status'],
        message = jsonMap['message'];
}
