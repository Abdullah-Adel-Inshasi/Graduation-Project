import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandLordSettings extends StatefulWidget {
  const LandLordSettings({Key? key}) : super(key: key);

  @override
  State<LandLordSettings> createState() => _LandLordSettingsState();
}

class _LandLordSettingsState extends State<LandLordSettings> {
  bool isPro = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SwitchListTile.adaptive(
          title: Text('Aqarat Pro'),
          secondary: Icon(Icons.add),
          value: isPro,
          onChanged: (x) {
            setState(() {
              isPro = x;
            });
          },
        ),
        ListTile(
          title: Text('show schedule'),
          leading: Icon(Icons.date_range),
        ),
        ListTile(
          title: Text('contact support'),
          leading: Icon(Icons.support_agent),
        ),
        ListTile(
          title: Text('log out'),
          leading: Icon(Icons.logout),
        )
      ],
    );
  }
}
