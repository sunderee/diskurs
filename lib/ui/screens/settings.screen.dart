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
      appBar: AppBar(
        title: Text(_settings.toolbarTitle),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(
          16.0,
        ),
        child: _buildSettingsPage(),
      ),
    );
  }

  Column _buildSettingsPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SwitchListTile(
          value: false,
          onChanged: (bool) {},
          title: Text(_settings.lightDarkTheme.first),
          subtitle: Text(_settings.lightDarkTheme.second),
        ),
        Divider(),
        ListTile(
          title: Text(_settings.bugReport.first),
          subtitle: Text(_settings.bugReport.second),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text(_settings.feedback.first),
          subtitle: Text(_settings.feedback.second),
          onTap: () {},
        ),
      ],
    );
  }
}
