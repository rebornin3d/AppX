import 'package:flutter/material.dart';

class ListTileContent extends StatelessWidget {
  final IconData? icon;
  final String? text;
  ListTileContent ({this.icon,this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon?? Icons.account_circle, color: Color (0xffFC6971), size: 24.0,),
          title: Text(text?? 'Profile', style: TextStyle(fontSize: 18.0)) ,

        ),
        Divider(height: 1,)
      ],
    );
  }
}
