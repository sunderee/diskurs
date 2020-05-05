import 'package:diskurs/api/models/thesaurus.model.dart';

class ResultModel {
  String _searchedTerm;
  double _average;
  List<ThesaurusModel> _thesaurusResults = [];

  String get searchedTerm => this._searchedTerm;
  double get average => this._average;
  List<ThesaurusModel> get thesaurusResults => this._thesaurusResults;

  ResultModel();

  ResultModel.from(String term, double avg, List<ThesaurusModel> results) {
    this._searchedTerm = term;
    this._average = avg;
    this._thesaurusResults = results;
  }

  ResultModel.fromJson(Map<String, dynamic> json) {
    this._searchedTerm = json['term'];
    this._average = json['avg'];
    for (int i = 0; i < json['sims'].length; i++) {
      this._thesaurusResults.add(ThesaurusModel.fromJson(json['sims'][i]));
    }
  }

  Map<String, dynamic> toJson() => {
        'term': this._searchedTerm,
        'avg': this._average,
        'sims': List.generate(
          this._thesaurusResults.length,
          (index) => this._thesaurusResults[index].toJson(),
        ),
      };
}
