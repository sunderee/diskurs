import 'package:diskurs/utils/pair.util.dart';

const SettingsModel SETTINGS_ENGLISH = SettingsModel(
  'Settings',
  Pair(
    'Dark theme',
    'Enable the application-wide dark theme',
  ),
  Pair(
    'Bug report',
    'Click here to submit a bug report',
  ),
  Pair(
    'Feedback',
    'Click here to submit a feedback about the app',
  ),
);

const SettingsModel SETTINGS_SLOVENIAN = SettingsModel(
  'Nastavitve',
  Pair(
    'Temna tema',
    'Omogočite temno temo za celotno aplikacijo.',
  ),
  Pair(
    'Poročilo o napaki',
    'Kliknite tukaj, če želite poslati poročilo o napaki.',
  ),
  Pair(
    'Povratne informacije',
    'Kliknite tukaj, če želite poslati povratne informacije o aplikaciji.',
  ),
);

const SettingsModel SETTINGS_CROATIAN = SettingsModel(
  'Postavke',
  Pair(
    'Tamna tema',
    'Omogućite tamnu temu za cijelu aplikaciju',
  ),
  Pair(
    'Izvještaj o pogrešci',
    'Kliknite ovdje kako biste poslali izvještaj o pogrešci',
  ),
  Pair(
    'Povratne informacije',
    'Kliknite ovdje kako biste poslali povratne informacije o aplikaciji',
  ),
);

const SettingsModel SETTINGS_SERBIAN = SettingsModel(
  'Podešavanja',
  Pair(
    'Tamna tema',
    'Omogućite tamnu temu širom aplikacije',
  ),
  Pair(
    'Izveštaj o grešci',
    'Kliknite ovde da pošaljete izveštaj o grešci',
  ),
  Pair(
    'Povratne informacije',
    'Kliknite ovde da biste poslali povratne informacije o aplikaciji',
  ),
);

class SettingsModel {
  final String toolbarTitle;
  final Pair<String, String> lightDarkTheme;
  final Pair<String, String> bugReport;
  final Pair<String, String> feedback;

  const SettingsModel(
    this.toolbarTitle,
    this.lightDarkTheme,
    this.bugReport,
    this.feedback,
  );
}
