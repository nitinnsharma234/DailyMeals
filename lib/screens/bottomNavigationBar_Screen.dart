import 'package:delimeals/screens/FavouritesScreen.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/MainDrawer.dart';

class BottomNavBar extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const BottomNavBar(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedTab = 0;

  void selectTabs(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  late List<Map<String, dynamic>> widgetList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgetList = [
      {"screens": const CategoriesScreen(), "title": "Categories"},
      {"screens": FavouriteScreen(widget.favouriteMeals), "title": "Favourites"}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widgetList[selectedTab]["title"]),
        ),
        body: widgetList[selectedTab]["screens"],
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectTabs,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_outline), label: "Favourites")
          ],
          currentIndex: selectedTab,
        ),
      ),
    );
  }
}
