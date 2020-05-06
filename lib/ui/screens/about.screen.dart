import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutScreen extends StatefulWidget {
  static const String routeName = '/about';

  @override
  State<StatefulWidget> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Info'),
      ),
    );
  }
}
