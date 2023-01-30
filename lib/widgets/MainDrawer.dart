import 'package:delimeals/screens/FiltersScreen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext context,String title, IconData icon,Function tapHandler)
  {
    return   ListTile(
      //tileColor: Colors.red,
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap:() => tapHandler(),
    ) ;
  }
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Cooking Now ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(context,"Meals", Icons.restaurant_menu,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile(context,"Filter", Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })

        ],
      ),
    );
  }
}
