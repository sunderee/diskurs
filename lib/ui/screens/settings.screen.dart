import 'package:diskurs/api/blocs/theme_changer.block.dart';
import 'package:diskurs/utils/constants/preferences.const.dart';
import 'package:diskurs/utils/constants/settings.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/info/more/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SharedPreferences sharedPreferences;

  SettingsModel _settings;

  bool _isDarkThemeSelected;

  @override
  void initState() {
    super.initState();
    _readSharedPreferencesFile();
  }

  @override
  Widget build(BuildContext context) {
    final int langPref = ModalRoute.of(context).settings.arguments;
    final ThemeChangerBloc theme = Provider.of<ThemeChangerBloc>(context);
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              value: _isDarkThemeSelected,
              onChanged: (checked) {
                setState(() {
                  _isDarkThemeSelected = checked;
                  theme.setTheme(_isDarkThemeSelected);
                  sharedPreferences.setBool('theme', checked);
                });
              },
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
        ),
      ),
    );
  }

  Future<void> _readSharedPreferencesFile() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool themePref = sharedPreferences.getBool(THEME_DATA_PREFERENCE) ?? false;
    setState(() => _isDarkThemeSelected = themePref);
  }
}
