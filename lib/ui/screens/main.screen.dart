import 'package:diskurs/utils/config.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _jsonString = '';

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_jsonString),
      ),
    );
  }

  Future<void> _loadJson() async {
    String json = await loadBaseApiUrl();
    setState(() {
      _jsonString = json;
    });
  }
}
