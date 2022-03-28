import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {

  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: [
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('User Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Store Settings'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Seller Mode'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ).toList(),
    );
  }

}