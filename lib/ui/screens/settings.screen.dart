import 'package:diskurs/utils/constants/settings.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/info/more/settings';

  SettingsModel _settings;

  @override
  Widget build(BuildContext context) {
    final int langPref = ModalRoute.of(context).settings.arguments;
    switch (langPref) {
      case 0:
        _settings = SETTINGS_SLOVENIAN;
        break;
      case 1:
        _settings = SETTINGS_CROATIAN;
        break;
      case 2:
        _settings = SETTINGS_SERBIAN;
        break;
      case 3:
        _settings = SETTINGS_ENGLISH;
        break;
      default:
        throw ArgumentError('The language preference was invalid');
    }
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
