import 'package:diskurs/api/blocs/kontekst.bloc.dart';
import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/api/models/result.model.dart';
import 'package:diskurs/utils/app_strings.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
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
            StreamBuilder(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildQueryList(
                    snapshot as AsyncSnapshot<ResultModel>,
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(
                  child: Icon(Icons.more_horiz),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildQueryList(AsyncSnapshot<ResultModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.thesaurusResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(snapshot.data.thesaurusResults[index].term),
          trailing: Text(
            '${snapshot.data.thesaurusResults[index].probability * 100}%',
          ),
        );
      },
    );
  }
}
