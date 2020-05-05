class RequestModel {
  String _languageCode;
  String _query;

  RequestModel();

  RequestModel.from(String lang, String qry) {
    _languageCode = lang;
    _query = qry;
  }

  RequestModel.fromJson(Map<String, dynamic> json) {
    _languageCode = json['lang'];
    _query = json['q'];
  }

  Map<String, dynamic> toJson() => {
        "lang": _languageCode,
        "q": _query,
      };
}
