import 'package:diskurs/api/blocs/kontekst.bloc.dart';
import 'package:diskurs/api/blocs/theme_changer.block.dart';
import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/ui/screens/corpus_lookup.screen.dart';
import 'package:diskurs/ui/screens/info.screen.dart';
import 'package:diskurs/utils/constants/app_strings.const.dart';
import 'package:diskurs/utils/constants/corpus_lookup.const.dart';
import 'package:diskurs/utils/constants/preferences.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LanguageStrings _currentLanguageStrings = slovenianLanguageStrings;
  String _query = '';
  Stream _stream = bloc.responseModelStream;

  @override
  Widget build(BuildContext context) {
    final ThemeChangerBloc theme = Provider.of<ThemeChangerBloc>(context);
    _readSharedPreferencesForTheme(theme);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Diskurs'),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(
              Icons.language,
              color: Colors.grey[600],
            ),
            onSelected: (int result) {
              switch (result) {
                case 0:
                  setState(
                    () => _currentLanguageStrings = slovenianLanguageStrings,
                  );
                  break;
                case 1:
                  setState(
                    () => _currentLanguageStrings = croatianLanguageStrings,
                  );
                  break;
                case 2:
                  setState(
                    () => _currentLanguageStrings = serbianLanguageStrings,
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 0,
                child: ListTile(
                  leading: Text(
                    'SL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  title: Text('Slovenščina'),
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: ListTile(
                  leading: Text(
                    'HR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  title: Text('Hrvatski'),
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                  leading: Text(
                    'SR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  title: Text('Srpski'),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey[600],
            ),
            onPressed: () {
              Navigator.pushNamed(context, InfoScreen.routeName);
            },
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: _currentLanguageStrings.searchFieldHint,
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.check,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    switch (_currentLanguageStrings.languageCode) {
                      case 0:
                        bloc.constructQuery(
                          LanguageConst.LANGUAGE_SLOVENIAN,
                          _query,
                        );
                        break;
                      case 1:
                        bloc.constructQuery(
                          LanguageConst.LANGUAGE_CROATIAN,
                          _query,
                        );
                        break;
                      case 2:
                        bloc.constructQuery(
                          LanguageConst.LANGUAGE_SERBIAN,
                          _query,
                        );
                        break;
                    }
                  },
                ),
              ),
              onChanged: (text) {
                setState(() => _query = text);
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _currentLanguageStrings.queryResults,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      _query,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 28.0,
                    color: Colors.lightBlue,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      CorpusLookupScreen.routeName,
                      arguments: CorpusLookupConst(
                        _currentLanguageStrings.languageCode,
                        _query,
                      ),
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            StreamBuilder(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: _buildQueryList(snapshot),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: Image(
                          image: AssetImage('loading.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildQueryList(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: snapshot.data.result.thesaurusResults.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(snapshot.data.result.thesaurusResults[index].term),
        trailing: Text(
          '${snapshot.data.result.thesaurusResults[index].probability}%',
        ),
      ),
    );
  }

  Future<void> _readSharedPreferencesForTheme(ThemeChangerBloc theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool themePref = sharedPreferences.getBool(THEME_DATA_PREFERENCE) ?? false;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: themePref ? Colors.grey[850] : Colors.white,
      ),
    );
    theme.setTheme(themePref);
  }
}
