import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/api/models/response.model.dart';
import 'package:diskurs/api/providers/kontekst.provider.dart';
import 'package:rxdart/subjects.dart';

class KontekstBloc {
  final KontekstProvider _provider = KontekstProvider();

  final PublishSubject _publishSubject = PublishSubject<ResponseModel>();

  Stream<ResponseModel> get responseModelStream => _publishSubject.stream;

  Future<void> constructQuery(String language, String queriedTerm) async {
    switch (language) {
      case LanguageConst.LANGUAGE_SLOVENIAN:
        print('BLOC got request for Slovenian language...');
        _publishSubject.sink.add(await _provider.requestSlo(queriedTerm));
        break;
      case LanguageConst.LANGUAGE_CROATIAN:
        print('BLOC got request for Croatian language...');
        _publishSubject.sink.add(await _provider.requestCro(queriedTerm));
        break;
      case LanguageConst.LANGUAGE_SERBIAN:
        print('BLOC got request for Serbian language...');
        _publishSubject.sink.add(await _provider.requestSrb(queriedTerm));
        break;
      default:
        break;
    }
  }

  void dispose() {
    print('Disposing stream');
    _publishSubject.close();
  }
}

final bloc = KontekstBloc();
