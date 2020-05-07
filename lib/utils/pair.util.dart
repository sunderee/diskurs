class Pair<F, S> {
  final F first;
  final S second;

  const Pair(this.first, this.second);

  factory Pair.fromList(List<dynamic> items) {
    if (items.length != 2) {
      throw ArgumentError('List should be of length 2');
    }
    return Pair<F, S>(
      items[0] as F,
      items[1] as S,
    );
  }
}
