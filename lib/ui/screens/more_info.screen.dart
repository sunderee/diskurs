import 'package:diskurs/ui/screens/about.screen.dart';
import 'package:diskurs/utils/constants/more_info.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreInfoScreen extends StatelessWidget {
  static const String routeName = '/info/more';

  List<MoreInfoModel> _moreInfoList;

  @override
  Widget build(BuildContext context) {
    final int langPref = ModalRoute.of(context).settings.arguments;
    switch (langPref) {
      case 0:
        _moreInfoList = MORE_INFO_SLOVENIAN;
        break;
      case 1:
        _moreInfoList = MORE_INFO_CROATIAN;
        break;
      case 2:
        _moreInfoList = MORE_INFO_SERBIAN;
        break;
      case 3:
        _moreInfoList = MORE_INFO_ENGLISH;
        break;
      default:
        throw ArgumentError('The language preference was invalid');
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('More info'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(_moreInfoList[index].title),
          subtitle: Text(_moreInfoList[index].description),
          onTap: () {
            Navigator.pushNamed(
              context,
              AboutScreen.routeName,
              arguments: langPref,
            );
          },
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 3,
      ),
    );
  }
}
