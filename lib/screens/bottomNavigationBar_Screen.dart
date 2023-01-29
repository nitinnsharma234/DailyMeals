import 'package:delimeals/screens/FavouritesScreen.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/MainDrawer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int selectedTab=0;
   void selectTabs(int index)
  {
    setState(() {
      selectedTab=index;
    });
  }
  final List<Map<String,dynamic>> widgetList  =const [
    {"screens": CategoriesScreen(),"title":"Categories"},{"screens":FavouriteScreen(),"title":"Favourites"}];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:  Text(widgetList[selectedTab]["title"]),),
        body: widgetList[selectedTab]["screens"],
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(onTap: selectTabs,items: const [BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.star_outline),label: "Favourites")],currentIndex: selectedTab,),
      ),
    );
  }
}
