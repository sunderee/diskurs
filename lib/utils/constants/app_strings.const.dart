const LanguageStrings slovenianLanguageStrings = LanguageStrings(
  0,
  'Iskalni niz',
  'Rezultati iskanja',
);

const LanguageStrings croatianLanguageStrings = LanguageStrings(
  1,
  'Upit za pretraživanje',
  'Rezultati upita',
);

const LanguageStrings serbianLanguageStrings = LanguageStrings(
  2,
  'Upit za pretragu',
  'Rezultati upita',
);

class LanguageStrings {
  final int languageCode;
  final String searchFieldHint;
  final String queryResults;
  const LanguageStrings(
      this.languageCode, this.searchFieldHint, this.queryResults);
}
