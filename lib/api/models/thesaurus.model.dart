class ThesaurusModel {
  String _term;
  int _probability;
  double _average;

  String get term => _term;
  int get probability => _probability;
  double get average => _average;

  ThesaurusModel();

  ThesaurusModel.from(String word, int prob, double avg) {
    _term = word;
    _probability = prob;
    _average = avg;
  }

  ThesaurusModel.fromJson(Map<String, dynamic> json) {
    _term = json['term'];
    _probability = json['freq'] != null
        ? ((json['freq'] as double) * 100).toInt()
        : json['prob'];
    _average = json['avg'];
  }

  Map<String, dynamic> toJson() => {
        'term': _term,
        'freq': _probability,
        'avg': _average,
      };
}
