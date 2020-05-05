import 'package:diskurs/api/models/response.model.dart';

abstract class IKontekstProvider {
  Future<ResponseModel> requestSlo(String query);
  Future<ResponseModel> requestCro(String query);
  Future<ResponseModel> requestSrb(String query);
}
