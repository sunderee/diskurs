import 'package:diskurs/utils/constants/about_app.const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = '/info/more/about';
  AboutAppModel _aboutApp;

  @override
  Widget build(BuildContext context) {
    final int langPref = ModalRoute.of(context).settings.arguments;
    switch (langPref) {
      case 0:
        _aboutApp = ABOUT_APP_SLOVENIAN;
        break;
      case 1:
        _aboutApp = ABOUT_APP_CROATIAN;
        break;
      case 2:
        _aboutApp = ABOUT_APP_SERBIAN;
        break;
      case 3:
        _aboutApp = ABOUT_APP_ENGLISH;
        break;
      default:
        throw ArgumentError('The language preference was invalid');
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_aboutApp.toolbarTitle),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(
          16.0,
        ),
        child: ListView(
          children: _buildListView(),
        ),
      ),
    );
  }

  List<Widget> _buildListView() {
    List<Widget> textColumns = [];
    for (int i = 0; i < _aboutApp.mainText.length; i++) {
      textColumns.add(Text(_aboutApp.mainText[i]));
      textColumns.add(SizedBox(height: 8.0));
    }
    textColumns.add(SizedBox(height: 32.0));
    textColumns.add(
      ListTile(
        leading: Icon(Icons.code),
        title: Text('Peter Aleksander Bizjak'),
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.grey,
            ),
            text: 'Developer\n',
            children: [
              TextSpan(text: 'Email: '),
              TextSpan(
                text: 'peter.aleksander.bizjak@ipm-digital.si',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    const String emailURL =
                        'mailto:peter.aleksander.bizjak@ipm-digital.si';
                    if (await canLaunch(emailURL)) {
                      await launch(emailURL);
                    }
                  },
              )
            ],
          ),
        ),
      ),
    );
    textColumns.add(SizedBox(height: 16.0));
    textColumns.add(
      ListTile(
        leading: Icon(Icons.palette),
        title: Text('Matej Aleksov'),
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.grey,
            ),
            text: 'Designer\n',
            children: [
              TextSpan(text: 'Email: '),
              TextSpan(
                text: 'aleksov.matej@gmail.com',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    const String emailURL = 'mailto:aleksov.matej@gmail.com';
                    if (await canLaunch(emailURL)) {
                      await launch(emailURL);
                    }
                  },
              )
            ],
          ),
        ),
      ),
    );
    textColumns.add(SizedBox(height: 16.0));
    textColumns.add(
      ListTile(
        leading: Icon(Icons.developer_board),
        title: Text('Marko Plahuta'),
        subtitle: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.grey,
            ),
            text: 'Virostatiq, kontekst.io developer\n',
            children: [
              TextSpan(text: 'Email: '),
              TextSpan(
                text: 'kontekst.io',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    const String emailURL = 'mailto:kontekst.io.info@gmail.com';
                    if (await canLaunch(emailURL)) {
                      await launch(emailURL);
                    }
                  },
              )
            ],
          ),
        ),
      ),
    );
    textColumns.add(
      ListTile(
        leading: Icon(Icons.text_fields),
        title: Text('LICENSE'),
        subtitle: Text('Licensed under MIT license'),
        onTap: () async {
          const String licenseURL =
              'https://gitlab.com/diskurs1/diskurs-app/-/raw/master/LICENSE.md';
          if (await canLaunch(licenseURL)) {
            await launch(licenseURL);
          }
        },
      ),
    );
    textColumns.add(
      ListTile(
        leading: Icon(Icons.list),
        title: Text('Open-source'),
        subtitle: Text('List of open source tools and libraries'),
        onTap: () async {
          const String pubspecyamlUrl =
              'https://gitlab.com/diskurs1/diskurs-app/-/raw/master/pubspec.yaml';
          if (await canLaunch(pubspecyamlUrl)) {
            await launch(pubspecyamlUrl);
          }
        },
      ),
    );
    textColumns.add(
      SizedBox(
        height: 16.0,
      ),
    );
    return textColumns;
  }
}
