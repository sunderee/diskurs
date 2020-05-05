class RequestModel {
  String _languageCode;
  String _query;

  RequestModel();

  RequestModel.from(String lang, String qry) {
    this._languageCode = lang;
    this._query = qry;
  }

  RequestModel.fromJson(Map<String, dynamic> json) {
    this._languageCode = json['lang'];
    this._query = json['q'];
  }

  Map<String, dynamic> toJson() => {
        "lang": _languageCode,
        "q": _query,
      };
}
