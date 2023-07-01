import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      onTap: tapHandler,
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'RobotoCondensed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              'Cooking Up!!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
