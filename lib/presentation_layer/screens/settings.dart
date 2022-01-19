
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../reusable_list_tile.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var bodyText = Theme.of(context).textTheme.bodyText1!;
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: AppColors.primary,
        leading: IconButton(
          icon:Icon(Icons.account_circle_outlined,size: 32,),
          onPressed: () =>Navigator.of(context).pop()  ,

        ),
        title: Text(
          'Firstname Lastname',
          style: bodyText.copyWith(fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTileContent(),
          ListTileContent(icon: Icons.settings, text: 'Settings'),
          ListTileContent(icon: Icons.live_help_outlined, text: 'Help'),
          ListTileContent(icon: Ionicons.alert_circle_outline, text: 'About'),
          ListTileContent(icon: Icons.clean_hands_sharp, text: 'Donate'),
          // ListTileContent(
          //     icon: MdiIcons.accountPlusOutline, text: 'Invite a friend'),
          ListTileContent(icon: Icons.account_balance_wallet, text: 'Sign Out'),
        ],
      ),
    //  bottomNavigationBar: PapucheBottomNavigationBar(),
    );
  }
}

