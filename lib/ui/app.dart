import 'package:diskurs/api/blocs/theme_changer.block.dart';
import 'package:diskurs/ui/screens/about.screen.dart';
import 'package:diskurs/ui/screens/corpus_lookup.screen.dart';
import 'package:diskurs/ui/screens/info.screen.dart';
import 'package:diskurs/ui/screens/main.screen.dart';
import 'package:diskurs/ui/screens/more_info.screen.dart';
import 'package:diskurs/ui/screens/settings.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeChangerBloc(),
      child: _InternalApp(),
    );
  }
}

class _InternalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeChangerBloc theme = Provider.of<ThemeChangerBloc>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      routes: _buildRoutes(context),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes(BuildContext buildContext) => {
        MainScreen.routeName: (buildContext) => MainScreen(),
        CorpusLookupScreen.routeName: (buildContext) => CorpusLookupScreen(),
        InfoScreen.routeName: (buildContext) => InfoScreen(),
        MoreInfoScreen.routeName: (buildContext) => MoreInfoScreen(),
        AboutScreen.routeName: (buildContext) => AboutScreen(),
        SettingsScreen.routeName: (buildContext) => SettingsScreen(),
      };
}
