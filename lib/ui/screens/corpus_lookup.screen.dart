import 'package:diskurs/ui/screens/constants/corpus_lookup.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CorpusLookupScreen extends StatefulWidget {
  static const String routeName = '/corpus';
  @override
  State<StatefulWidget> createState() => _CorpusLookupScreenState();
}

class _CorpusLookupScreenState extends State<CorpusLookupScreen> {
  @override
  Widget build(BuildContext context) {
    final CorpusLookupConst args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_setAppBarTitle(args.languageCode)),
      ),
    );
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
}

class _ToolbarTitleString {
  static const LANGUAGE_SLOVENIAN = 'Primeri iz splošnega korpusa';
  static const LANGUAGE_CROATIAN = 'Primjeri iz općenitog korpusa';
  static const LANGUAGE_SERBIAN = 'Primeri iz općenitog korpusa';
}
