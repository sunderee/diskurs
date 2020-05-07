import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/api/models/corpus_response.model.dart';
import 'package:diskurs/api/models/response.model.dart';
import 'package:diskurs/api/providers/kontekst.provider.dart';
import 'package:rxdart/subjects.dart';

class KontekstBloc {
  final KontekstProvider _provider = KontekstProvider();

  final PublishSubject _publishSubject = PublishSubject<ResponseModel>();
  final PublishSubject _publishSubjectCorpus =
      PublishSubject<CorpusResponseModel>();

  Stream<ResponseModel> get responseModelStream => _publishSubject.stream;
  Stream<CorpusResponseModel> get corpusResponseModelStream =>
      _publishSubjectCorpus.stream;

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

  Future<void> constructCorpusQuery(String language, String queriedTerm) async {
    switch (language) {
      case LanguageConst.LANGUAGE_SLOVENIAN:
        print('BLOC got request for corpus lookup in Slovenian language...');
        _publishSubjectCorpus.sink.add(
          await _provider.requestCorpusSlo(queriedTerm),
        );
        break;
      case LanguageConst.LANGUAGE_CROATIAN:
        print('BLOC got request for corpus lookup in Croatian language...');
        _publishSubjectCorpus.sink.add(
          await _provider.requestCorpusCro(queriedTerm),
        );
        break;
      case LanguageConst.LANGUAGE_SERBIAN:
        print('BLOC got request for corpus lookup in Serbian language...');
        _publishSubjectCorpus.sink.add(
          await _provider.requestCorpusSrb(queriedTerm),
        );
        break;
      default:
    }
  }

  void dispose() {
    print('Disposing stream');
    _publishSubject.close();
    _publishSubjectCorpus.close();
  }
}

final bloc = KontekstBloc();
