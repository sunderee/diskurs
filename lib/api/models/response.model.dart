import 'package:diskurs/api/models/result.model.dart';

class ResponseModel {
  int _statusCode;
  ResultModel _result;

  int get statusCode => _statusCode;
  ResultModel get result => _result;

  ResponseModel();

  ResponseModel.from(int code, ResultModel model) {
    _statusCode = code;
    _result = model;
  }

  ResponseModel.fromJson(Map<String, dynamic> json) {
    _statusCode = json['status'];
    _result = ResultModel.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() => {
        'status': _statusCode,
        'result': _result.toJson(),
      };
}
