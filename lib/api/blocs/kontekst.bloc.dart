import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/api/models/response.model.dart';
import 'package:diskurs/api/repositories/kontekst.repository.dart';
import 'package:rxdart/subjects.dart';

class KontekstBloc {
  final _repo = KontekstRepository();

  final PublishSubject _publishSubject = PublishSubject<ResponseModel>();

  Stream<ResponseModel> get responseModelStream => _publishSubject.stream;

  Future<void> constructQuery(String language, String queriedTerm) async {
    switch (language) {
      case LanguageConst.LANGUAGE_SLOVENIAN:
        _publishSubject.sink.add(await _repo.sloQuery(queriedTerm));
        break;
      case LanguageConst.LANGUAGE_CROATIAN:
        _publishSubject.sink.add(await _repo.croQuery(queriedTerm));
        break;
      case LanguageConst.LANGUAGE_SERBIAN:
        _publishSubject.sink.add(await _repo.srbQuery(queriedTerm));
        break;
      default:
        break;
    }
  }

  void dispose() {
    _publishSubject.close();
  }
}

final bloc = KontekstBloc();
