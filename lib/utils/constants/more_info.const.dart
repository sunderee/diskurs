const List<MoreInfoModel> MORE_INFO_SLOVENIAN = [
  MoreInfoModel(
    'O aplikaciji',
    'Spoznajte našo aplikacijo, preberite licenco in seznam odprtokodnih orodij, ki so bili uporabljeni za izdelavo te aplikacije',
  ),
  MoreInfoModel(
    'Nastavitve',
    'Nastavitve aplikacije, vključno s preklapljanjem med svetlim in temnim načinom, dostop do spletnega mesta poročila o napakah in povratnih informacij',
  ),
  MoreInfoModel(
    'Izvorna koda',
    'Kliknite tukaj, če želite biti usmerjeni na GitLab repozitorij, ki gosti izvirno kodo aplikacije',
  )
];

const List<MoreInfoModel> MORE_INFO_CROATIAN = [
  MoreInfoModel(
    'O aplikaciji',
    'Saznajte više o našoj aplikaciji, pročitajte licencu i popis otvorenih alata koji se koriste za njenu izradu',
  ),
  MoreInfoModel(
    'Postavke',
    'Postavke aplikacije, uključujući prebacivanje između svijetlog i tamnog načina rada, pristup web mjestu s izvješćima o pogreškama i povratnim informacijama',
  ),
  MoreInfoModel(
    'Source code',
    'Kliknite ovdje da biste bili usmjereni do GitLab repozitorija s izvornim kodom aplikacije',
  )
];

const List<MoreInfoModel> MORE_INFO_SERBIAN = [
  MoreInfoModel(
    'O aplikaciji',
    'Saznajte više o našoj aplikaciji, pročitajte licencu i spisak alata otvorenog koda koji se koriste za njenu izradu',
  ),
  MoreInfoModel(
    'Podešavanja',
    'Podešavanja aplikacije, uključujući prebacivanje između svetlog i tamnog režima, pristup lokaciji izveštaja o greškama i povratnim informacijama',
  ),
  MoreInfoModel(
    'Source code',
    'Kliknite ovde da biste bili usmereni na GitLab repozitorij izvornog koda aplikacije',
  )
];

const List<MoreInfoModel> MORE_INFO_ENGLISH = [
  MoreInfoModel(
    'About the app',
    'Learn about our app, read the license and list of open-source tooling used to build it',
  ),
  MoreInfoModel(
    'Settings',
    'App settings, including toggle between light and dark mode, access bug report site and feedbacks',
  ),
  MoreInfoModel(
    'Source code',
    'Click here to be directed to the GitLab repository hosting source code of the app',
  )
];

class MoreInfoModel {
  final String title;
  final String description;

  const MoreInfoModel(this.title, this.description);
}
