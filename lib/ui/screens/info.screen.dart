import 'package:diskurs/ui/screens/more_info.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoScreen extends StatelessWidget {
  static const String routeName = '/info';

  final List<_ListTileContents> _listTileContents = [
    _ListTileContents(
      'SL | Slovenščina',
      'Dostop do informacij o aplikaciji, nastavitvah in kontaktnih informacijah v slovenščini',
    ),
    _ListTileContents(
      'HR | Hrvatski',
      'Pristupite podacima, postavkama i kontaktnim podacima o aplikaciji na hrvatskom',
    ),
    _ListTileContents(
      'SR | Srpski',
      'Pristupite informacijama o aplikaciji, podešavanjima i kontaktnim podacima na srpskom',
    ),
    _ListTileContents(
      'EN | Engleski',
      'Access app info, settings and contact information in English',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(_listTileContents[index].languageCode),
          subtitle: Text(_listTileContents[index].description),
          onTap: () {
            Navigator.pushNamed(
              context,
              MoreInfoScreen.routeName,
              arguments: index,
            );
          },
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 4,
      ),
    );
  }
}

class _ListTileContents {
  final String languageCode;
  final String description;

  _ListTileContents(this.languageCode, this.description);
}
