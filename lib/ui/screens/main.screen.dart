import 'package:diskurs/api/blocs/kontekst.bloc.dart';
import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/ui/screens/constants/corpus_lookup.const.dart';
import 'package:diskurs/ui/screens/corpus_lookup.screen.dart';
import 'package:diskurs/utils/app_strings.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
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
                  print(
                    'Stream seems to be alright, let\'s build the ListView...',
                  );
                  return Expanded(
                    child: _buildQueryList(snapshot),
                  );
                } else if (snapshot.hasError) {
                  print('Error in a stream!');
                  return Text(snapshot.error.toString());
                } else {
                  print('BLOC stream is still empty...');
                  return Center(
                    child: Icon(Icons.more_horiz),
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
    print('Building the ListView with snapshot ${snapshot.data}');
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: snapshot.data.result.thesaurusResults.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(snapshot.data.result.thesaurusResults[index].term),
        trailing: Text(
          '${snapshot.data.result.thesaurusResults[index].probability}',
        ),
      ),
    );
  }
}
