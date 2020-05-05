class ThesaurusModel {
  String _term;
  int _probability;
  double _average;

  String get term => this._term;
  int get probability => this._probability;
  double get average => this._average;

  ThesaurusModel();

  ThesaurusModel.from(String word, int prob, double avg) {
    this._term = word;
    this._probability = prob;
    this._average = avg;
  }

  ThesaurusModel.fromJson(Map<String, dynamic> json) {
    this._term = json['term'];
    this._probability = json['prob'];
    this._average = json['avg'];
  }

  Map<String, dynamic> toJson() => {
        'term': this._term,
        'prob': this._probability,
        'avg': this._average,
      };
}
