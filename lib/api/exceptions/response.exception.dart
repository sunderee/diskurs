class ResponseException implements Exception {
  final int code;
  final String description;

  ResponseException(this.code, this.description);

  String toString() => 'Code ${this.code}\n${this.description}';
}
