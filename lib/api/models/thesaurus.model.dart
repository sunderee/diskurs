class ThesaurusModel {
  String _term;
  double _probability;
  double _average;

  String get term => _term;
  double get probability => _probability;
  double get average => _average;

  ThesaurusModel();

  ThesaurusModel.from(String word, double prob, double avg) {
    _term = word;
    _probability = prob;
    _average = avg;
  }

  ThesaurusModel.fromJson(Map<String, dynamic> json) {
    print('Decoding third layer of the response...');
    _term = json['term'];
    _probability = json['freq'];
    _average = json['avg'];
  }

  Map<String, dynamic> toJson() => {
        'term': _term,
        'freq': _probability,
        'avg': _average,
      };
}
