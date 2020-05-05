import 'package:diskurs/api/models/response.model.dart';
import 'package:diskurs/api/providers/kontekst.provider.dart';

class KontekstRepository {
  final _provider = KontekstProvider();

  Future<ResponseModel> sloQuery(String query) => _provider.requestSlo(query);
  Future<ResponseModel> croQuery(String query) => _provider.requestCro(query);
  Future<ResponseModel> srbQuery(String query) => _provider.requestSrb(query);
}
