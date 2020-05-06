import 'package:diskurs/ui/screens/about.screen.dart';
import 'package:diskurs/ui/screens/corpus_lookup.screen.dart';
import 'package:diskurs/ui/screens/info.screen.dart';
import 'package:diskurs/ui/screens/main.screen.dart';
import 'package:diskurs/ui/screens/more_info.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
      ),
      routes: _buildRoutes(context),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes(BuildContext buildContext) => {
        MainScreen.routeName: (buildContext) => MainScreen(),
        CorpusLookupScreen.routeName: (buildContext) => CorpusLookupScreen(),
        InfoScreen.routeName: (buildContext) => InfoScreen(),
        MoreInfoScreen.routeName: (buildContext) => MoreInfoScreen(),
        AboutScreen.routeName: (buildContext) => AboutScreen(),
      };
}
