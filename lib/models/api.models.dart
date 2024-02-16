class ApiResponseModel {
  bool? success;
  String? message;
  dynamic result;

  ApiResponseModel({this.success, this.message, this.result});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['result'] = this.result;
    return data;
  }
}