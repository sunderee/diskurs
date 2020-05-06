import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.separated(
        itemBuilder: null,
        separatorBuilder: null,
        itemCount: null,
      ),
    );
  }
}

class _ListTileContents {
  final String title;
  final String description;

  _ListTileContents(this.title, this.description);
}
