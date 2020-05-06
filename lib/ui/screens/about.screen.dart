import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/about';

  final List<_ListTileContents> _listTileContents = [
    _ListTileContents(
      'SL',
      'Dostop do informacij o aplikacij v slovenščini',
    ),
    _ListTileContents(
      'HR',
      'Pristup podacima o aplikaciji na hrvatskom',
    ),
    _ListTileContents(
      'SR',
      'Pristupite informacijama o aplikaciji na srpskom',
    ),
    _ListTileContents(
      'EN',
      'Access app info in English',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(_listTileContents[index].languageCode),
          subtitle: Text(_listTileContents[index].description),
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
