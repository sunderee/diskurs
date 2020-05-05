import 'dart:convert';

import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/api/exceptions/request.exception.dart';
import 'package:diskurs/api/exceptions/response.exception.dart';
import 'package:diskurs/api/models/request.model.dart';
import 'package:diskurs/api/models/response.model.dart';
import 'package:diskurs/api/providers/ikontekst.provider.dart';
import 'package:diskurs/utils/config.util.dart';
import 'package:http/http.dart' show Client;

class KontekstProvider implements IKontekstProvider {
  static final KontekstProvider _instance = KontekstProvider._internal();

  String _baseURL = '';
  Client _client = Client();

  factory KontekstProvider() {
    return _instance;
  }

  KontekstProvider._internal() {
    loadBaseApiUrl()
        .then((url) => _baseURL = url)
        .catchError((error) => print(error));
  }

  @override
  Future<ResponseModel> requestSlo(String query) async {
    const languageCode = LanguageConst.LANGUAGE_SLOVENIAN;
    if (_baseURL.isNotEmpty && query.isNotEmpty) {
      final requestModel = RequestModel.from(languageCode, query);
      final response = await _client.post(
        _baseURL,
        body: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(jsonDecode(response.body));
      }
      throw ResponseException(response.statusCode, 'Failed for lang=sl query');
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
        body: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(jsonDecode(response.body));
      }
      throw ResponseException(response.statusCode, 'Failed for lang=hr query');
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
        body: requestModel.toJson(),
      );
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(jsonDecode(response.body));
      }
      throw ResponseException(response.statusCode, 'Failed for lang=sr query');
    }
    throw RequestException('Request for lang=sr failed');
  }
}
