import 'package:diskurs/api/blocs/kontekst.bloc.dart';
import 'package:diskurs/api/constants/language.const.dart';
import 'package:diskurs/utils/constants/corpus_lookup.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CorpusLookupScreen extends StatefulWidget {
  static const String routeName = '/corpus';
  @override
  State<StatefulWidget> createState() => _CorpusLookupScreenState();
}

class _CorpusLookupScreenState extends State<CorpusLookupScreen> {
  Stream _stream = bloc.corpusResponseModelStream;

  @override
  Widget build(BuildContext context) {
    final CorpusLookupConst args = ModalRoute.of(context).settings.arguments;
    _initializeCorpusQuery(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(_setAppBarTitle(args.languageCode)),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildCorpusQueryList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _initializeCorpusQuery(CorpusLookupConst lookupConst) {
    switch (lookupConst.languageCode) {
      case 0:
        bloc.constructCorpusQuery(
          LanguageConst.LANGUAGE_SLOVENIAN,
          lookupConst.query,
        );
        break;
      case 1:
        bloc.constructCorpusQuery(
          LanguageConst.LANGUAGE_CROATIAN,
          lookupConst.query,
        );
        break;
      case 2:
        bloc.constructCorpusQuery(
          LanguageConst.LANGUAGE_SERBIAN,
          lookupConst.query,
        );
        break;
      default:
        break;
    }
  }

  String _setAppBarTitle(int languageCode) {
    switch (languageCode) {
      case 0:
        return _ToolbarTitleString.LANGUAGE_SLOVENIAN;
      case 1:
        return _ToolbarTitleString.LANGUAGE_CROATIAN;
      case 2:
        return _ToolbarTitleString.LANGUAGE_SERBIAN;
      default:
        return _ToolbarTitleString.LANGUAGE_SLOVENIAN;
    }
  }

  ListView _buildCorpusQueryList(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.corpusLookupResults.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(
          Icons.format_quote,
          color: Colors.lightBlue,
        ),
        title: Text(snapshot.data.corpusLookupResults[index]),
      ),
    );
  }
}

class _ToolbarTitleString {
  static const LANGUAGE_SLOVENIAN = 'Primeri iz splo??nega korpusa';
  static const LANGUAGE_CROATIAN = 'Primjeri iz op??enitog korpusa';
  static const LANGUAGE_SERBIAN = 'Primeri iz op??enitog korpusa';
}
