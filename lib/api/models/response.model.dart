import 'package:diskurs/api/models/result.model.dart';

class ResponseModel {
  int _statusCode;
  ResultModel _result;

  int get statusCode => this._statusCode;
  ResultModel get result => this._result;

  ResponseModel();

  ResponseModel.from(int code, ResultModel model) {
    this._statusCode = code;
    this._result = model;
  }

  ResponseModel.fromJson(Map<String, dynamic> json) {
    this._statusCode = json['status'];
    this._result = ResultModel.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() => {
        'status': this._statusCode,
        'result': this._result.toJson(),
      };
}
