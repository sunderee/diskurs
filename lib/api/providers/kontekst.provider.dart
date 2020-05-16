import 'dart:convert';

import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/api/exceptions/request.exception.dart';
import 'package:diskurs/api/models/corpus_response.model.dart';
import 'package:diskurs/api/models/request.model.dart';
import 'package:diskurs/api/models/response.model.dart';
import 'package:diskurs/api/providers/ikontekst.provider.dart';
import 'package:diskurs/utils/config.util.dart';
import 'package:http/http.dart' show Client;

class KontekstProvider implements IKontekstProvider {
  static final KontekstProvider _instance = KontekstProvider._internal();

  String _baseURL = '';
  String _corpusURL = '';
  Client _client = Client();

  factory KontekstProvider() {
    return _instance;
  }

  KontekstProvider._internal() {
    loadBaseApiUrl()
        .then((url) => _baseURL = url)
        .catchError((error) => print(error));
    loadCorpusApiUrl()
        .then((url) => _corpusURL = url)
        .catchError((error) => print(error));
  }

  @override
  Future<ResponseModel> requestSlo(String query) async {
    const languageCode = LanguageConst.LANGUAGE_SLOVENIAN;
    if (_baseURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _baseURL,
        body: jsonEncode(requestModel.toJson()),
      );
      return ResponseModel.fromJson(jsonDecode(response.body));
    }
    throw RequestException('Request for lang=sl failed');
  }

  @override
  Future<ResponseModel> requestCro(String query) async {
    const languageCode = LanguageConst.LANGUAGE_CROATIAN;
    if (_baseURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _baseURL,
        body: jsonEncode(requestModel.toJson()),
      );
      return ResponseModel.fromJson(jsonDecode(response.body));
    }
    throw RequestException('Request for lang=hr failed');
  }

  @override
  Future<ResponseModel> requestSrb(String query) async {
    const languageCode = LanguageConst.LANGUAGE_SERBIAN;
    if (_baseURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _baseURL,
        body: jsonEncode(requestModel.toJson()),
      );
      return ResponseModel.fromJson(jsonDecode(response.body));
    }
    throw RequestException('Request for lang=sr failed');
  }

  @override
  Future<CorpusResponseModel> requestCorpusSlo(String query) async {
    const languageCode = LanguageConst.LANGUAGE_SLOVENIAN;
    if (_corpusURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _corpusURL,
        body: jsonEncode(requestModel.toJson()),
      );
      return CorpusResponseModel.fromJson(jsonDecode(response.body));
    }
    throw RequestException('Corpus lookup request for lang=sl failed');
  }

  @override
  Future<CorpusResponseModel> requestCorpusCro(String query) async {
    const languageCode = LanguageConst.LANGUAGE_CROATIAN;
    if (_corpusURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _corpusURL,
        body: jsonEncode(requestModel.toJson()),
      );
      return CorpusResponseModel.fromJson(jsonDecode(response.body));
    }
    throw RequestException('Corpus lookup request for lang=hr failed');
  }

  @override
  Future<CorpusResponseModel> requestCorpusSrb(String query) async {
    const languageCode = LanguageConst.LANGUAGE_SERBIAN;
    if (_corpusURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _corpusURL,
        body: jsonEncode(requestModel.toJson()),
      );
      return CorpusResponseModel.fromJson(jsonDecode(response.body));
    }
    throw RequestException('Corpus lookup request for lang=sr failed');
  }
}
