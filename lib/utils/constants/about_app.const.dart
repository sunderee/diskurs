const ABOUT_APP_SLOVENIAN = AboutAppModel(
  'O aplikaciji',
  [],
);

const ABOUT_APP_CROATIAN = AboutAppModel(
  'O aplikaciji',
  [],
);

const ABOUT_APP_SERBIAN = AboutAppModel(
  'O aplikaciji',
  [],
);

const ABOUT_APP_ENGLISH = AboutAppModel(
  'About app',
  [
    'Diskurs is a cross-platform mobile thesaurus application with the capability of querying corpora for samples of word usages. It supports the three major Balkan languages: Slovenian, Croatian, and Serbian.',
    'The application is developed with the help of APIs powering kontekst.io.',
    'Kontekst.io is a search engine for related words and phrases, which are automatically generated from several text corpora of modern Slovenian, and later translated to Croatian and Serbian.',
    'The Slovenian search engine is based on a word2vec model that assigns each word/phrase a position in the latent space so that words used in similar contexts are also close in the latent space.',
    'The base model used by kontekst.io contains about 600,000 words and phrases.',
    'Diskurs takes the idea set by kontekst.io and embodies it in the form of a cross-platform mobile application. It relies on APIs provided by kontekst.io.',
    'In the Balkan region, we lack a thesaurus application. Although countries, respectively, have made some solid progress in the direction of the digitalization of dictionaries, we are yet to see a thesaurus as powerful as counterparts from major languages such as English. If we intend to change that, a joint effort is required.',
    'Through doing so, we are looking at possibly the first united thesaurus for the three major languages in the Balkan area: Slovenian, Croatian and Serbian. Coupled with examples of word usages, the application provides a ubiquitous medium for students and experts alike who are looking at related phrases either to enrich their writing or to deduce the meaning of a word through checking the similar phrases.',
    'Application was developed by Peter Aleksander Bizjak. Special thanks go to Matej Aleksov for providing design and logos as well as Marko Plahuta from Virostatiq, company behind kontekst.io, for providing access to APIs.',
  ],
);

class AboutAppModel {
  final String toolbarTitle;
  final List<String> mainText;

  const AboutAppModel(this.toolbarTitle, this.mainText);
}
