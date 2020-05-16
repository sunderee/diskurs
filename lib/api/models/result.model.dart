import 'package:diskurs/api/models/thesaurus.model.dart';

class ResultModel {
  String _searchedTerm;
  double _average;
  List<ThesaurusModel> _thesaurusResults = [];

  String get searchedTerm => _searchedTerm;
  double get average => _average;
  List<ThesaurusModel> get thesaurusResults => _thesaurusResults;

  ResultModel();

  ResultModel.from(String term, double avg, List<ThesaurusModel> results) {
    _searchedTerm = term;
    _average = avg;
    _thesaurusResults = results;
  }

  ResultModel.fromJson(Map<String, dynamic> json) {
    _searchedTerm = json['term'];
    _average = json['avg'];
    for (int i = 0; i < json['sims'].length; i++) {
      _thesaurusResults.add(
        ThesaurusModel.fromJson(
          json['sims'][i],
        ),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        'term': _searchedTerm,
        'avg': _average,
        'sims': List.generate(
          _thesaurusResults.length,
          (index) => _thesaurusResults[index].toJson(),
        ),
      };
}
