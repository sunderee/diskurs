import 'package:diskurs/api/models/corpus_response.model.dart';
import 'package:diskurs/api/models/response.model.dart';

abstract class IKontekstProvider {
  Future<ResponseModel> requestSlo(String query);
  Future<ResponseModel> requestCro(String query);
  Future<ResponseModel> requestSrb(String query);

  Future<CorpusResponseModel> requestCorpusSlo(String query);
  Future<CorpusResponseModel> requestCorpusCro(String query);
  Future<CorpusResponseModel> requestCorpusSrb(String query);
}
