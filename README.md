# diskurs

Diskurs is a Flutter-based cross-platform dictionary and thesaurus mobile application for major languages in the Balkan area (Slovenian, Croatian and Serbian).

## Motivation

The application is developed with the help of APIs powering [kontekst.io](https://www.kontekst.io/).

`kontekst.io` is a search engine for related words and phrases, which are automatically generated from several text corpora of modern Slovenian, and later translated to Croatian and Serbian.

The Slovenian search engine is based on a `word2vec` model that assigns each word/phrase a position in the latent space so that words used in similar contexts are also close in the latent space.

The base model used bu `kontekst.io` contains about 600,000 words and phrases.

_Diskurs_ takes the idea set by `kontekst.io` and embodies it in the form of a cross-platform mobile application. It relies on APIs provided by `kontekst.io`. For safety reasons, these are kept private.

The initial tech demo project was a blend of a [web scraper backend](https://gitlab.com/diskurs1/discurs-backend) and a [mobile application](https://gitlab.com/diskurs1/discurs), but since the access to the APIs was granted (courtesy of developers behind `kontekst.io`), the former project is discontinued, but remains in the open-source domain for educational purposes. The latter, the mobile application, is being developed separately within this GitLab project.

The aforementioned backend application has been deployed to Heroku, so for the time being, you can test it through [this base URL](https://diskurs-api.herokuapp.com/). In the future, hosting might be canceled.

In all this talk, I still have not contrived to explain the motivation for the development of _Diskurs_ application. Well, let's get to the point, otherwise, README will take up more space than the actual source code it's supposed to represent.

In the Balkan region, we lack a thesaurus application. Sure, you can use Google Translate and search through related terms, but we all agree it's not optimum.

Although Balkan countries, respectively, have made some solid progress in the direction of the digitalization of dictionaries, we are yet to see a thesaurus as powerful as [thesaurus.com](https://www.thesaurus.com/), for instance. If we intend to change that, a joint effort is required.

Through doing so, we are looking at possibly the first united thesaurus for the three major languages in the Balkan area: Slovenian, Croatian and Serbian. Coupled with examples of word usages, the application provides a ubiquitous medium for students and experts alike who are looking at related phrases either to enrich their writing or to deduce the meaning of a word through checking the similar phrases (which is how sites like Wiktionary usually work).

## Usage

The application, right now, is in the earliest stages of development. This section will get populated once I'm satisfied with the version 0.0.1 and before we move on to 0.0.2 (and public beta, of course).

## License

The application is closed-source, but this will change in the future. The reason why I am licensing it under a proprietary license is to protect the intellectual property until it's suitable for release to the public.
