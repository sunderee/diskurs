import 'package:diskurs/utils/about_page.util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'SL',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: AboutPageUtil.ABOUT_SLOVENIAN[0],
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SLOVENIAN[1]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SLOVENIAN[2],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[0])) {
                            await launch(AboutPageUtil.LINKS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SLOVENIAN[3]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SLOVENIAN[4],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[1])) {
                            await launch(AboutPageUtil.LINKS[1]);
                          }
                        },
                    ),
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SLOVENIAN[5]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SLOVENIAN[6],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[0])) {
                            await launch(AboutPageUtil.EMAILS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SLOVENIAN[7]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SLOVENIAN[8],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[1])) {
                            await launch(AboutPageUtil.EMAILS[1]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SLOVENIAN[9]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SLOVENIAN[10],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[2])) {
                            await launch(AboutPageUtil.LINKS[2]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SLOVENIAN[11]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'HR',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: AboutPageUtil.ABOUT_CROATIAN[0],
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_CROATIAN[1]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_CROATIAN[2],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[0])) {
                            await launch(AboutPageUtil.LINKS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_CROATIAN[3]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_CROATIAN[4],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[1])) {
                            await launch(AboutPageUtil.LINKS[1]);
                          }
                        },
                    ),
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_CROATIAN[5]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_CROATIAN[6],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[0])) {
                            await launch(AboutPageUtil.EMAILS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_CROATIAN[7]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_CROATIAN[8],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[1])) {
                            await launch(AboutPageUtil.EMAILS[1]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_CROATIAN[9]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_CROATIAN[10],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[2])) {
                            await launch(AboutPageUtil.LINKS[2]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_CROATIAN[11]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'SR',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: AboutPageUtil.ABOUT_SERBIAN[0],
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SERBIAN[1]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SERBIAN[2],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[0])) {
                            await launch(AboutPageUtil.LINKS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SERBIAN[3]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SERBIAN[4],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[1])) {
                            await launch(AboutPageUtil.LINKS[1]);
                          }
                        },
                    ),
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SERBIAN[5]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SERBIAN[6],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[0])) {
                            await launch(AboutPageUtil.EMAILS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SERBIAN[7]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SERBIAN[8],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[1])) {
                            await launch(AboutPageUtil.EMAILS[1]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SERBIAN[9]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_SERBIAN[10],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[2])) {
                            await launch(AboutPageUtil.LINKS[2]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_SERBIAN[11]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'EN',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: AboutPageUtil.ABOUT_ENGLISH[0],
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_ENGLISH[1]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_ENGLISH[2],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[0])) {
                            await launch(AboutPageUtil.LINKS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_ENGLISH[3]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_ENGLISH[4],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[1])) {
                            await launch(AboutPageUtil.LINKS[1]);
                          }
                        },
                    ),
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_ENGLISH[5]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_ENGLISH[6],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[0])) {
                            await launch(AboutPageUtil.EMAILS[0]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_ENGLISH[7]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_ENGLISH[8],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.EMAILS[1])) {
                            await launch(AboutPageUtil.EMAILS[1]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_ENGLISH[9]),
                    TextSpan(
                      text: AboutPageUtil.ABOUT_ENGLISH[10],
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await canLaunch(AboutPageUtil.LINKS[2])) {
                            await launch(AboutPageUtil.LINKS[2]);
                          }
                        },
                    ),
                    TextSpan(text: AboutPageUtil.ABOUT_ENGLISH[11]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
