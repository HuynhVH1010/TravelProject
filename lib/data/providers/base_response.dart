enum Status { LOADING, COMPLETED, ERROR }

class StatusResponse<T> {
  Status status;
  String? message;
  T? data;

  StatusResponse.loading(this.message) : status = Status.LOADING;
  StatusResponse.completed(this.data) : status = Status.COMPLETED;
  StatusResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

class BaseReponse<T>{
  late int code;
  late int status_code;
  late String message;
  late dynamic data;
  late int page = 1;
  late int pageCount = 1;
  late int rowCount = 0;

  BaseReponse({
    required this.code,
    required this.status_code,
    required this.message,
    required this.data,
  });

  @override
  String toString() {
    //print("code: $code \n status_code: $status_code \n Message: $message \n Data: $data");
    return "$message ($status_code)";
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> json = Map();
    json["Code"] = this.code;
    json["Msg"] = this.message;
    json["Data"] = this.data;
    return json;
  }
}