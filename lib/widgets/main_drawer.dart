import 'package:flutter/material.dart';
import 'package:udemy/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      {required String title,
      required IconData icon,
      required void Function() tapHandler}) {
    return ListTile(
        onTap: tapHandler, leading: Icon(icon, size: 26), title: Text(title));
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
              title: 'Meals',
              icon: Icons.restaurant,
              tapHandler: () =>
                  Navigator.of(context).pushReplacementNamed('/')),
          buildListTile(
              title: 'Filter',
              icon: Icons.settings,
              tapHandler: () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName))
        ],
      ),
    );
  }
}
