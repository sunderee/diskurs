class CorpusResponseModel {
  List<String> _corpusLookupResults = [];
  int _statusCode;

  List<String> get corpusLookupResults => _corpusLookupResults;
  int get statusCode => _statusCode;

  CorpusResponseModel();

  CorpusResponseModel.from(List<String> results, int code) {
    _corpusLookupResults = results;
    _statusCode = code;
  }

  CorpusResponseModel.fromJson(Map<String, dynamic> json) {
    for (int i = 0; i < json['result'].length; i++) {
      _corpusLookupResults.add(json['result'][i]);
    }
    _statusCode = json['status'];
  }

  Map<String, dynamic> toJson() => {
        'result': List.generate(
          _corpusLookupResults.length,
          (index) => _corpusLookupResults[index],
        ),
        'status': _statusCode
      };
}
