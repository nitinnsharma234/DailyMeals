import 'package:flutter/material.dart';
import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
    final List<Meal> availableMeals;
    const CategoryMealsScreen(this.availableMeals,{super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   late String categoryTitle;

  late List<Meal>displayedMeals;
   var  _loadedInitData =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void removeMeal(String mealId)
  {
    setState(() {
        displayedMeals.removeWhere((meal) => meal.id==mealId );
    });
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   if(!_loadedInitData)
     {
       final routeArgs =
       ModalRoute.of(context)?.settings.arguments as Map<String, String>;
       categoryTitle = routeArgs['title']!;
       final categoryId = routeArgs['id'];
       displayedMeals = widget.availableMeals.where((meal) {
         return meal.categories.contains(categoryId);
       }).toList();
     }
    _loadedInitData=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
                displayedMeals[idx].id,
                displayedMeals[idx].title,
                displayedMeals[idx].imageUrl,
                displayedMeals[idx].duration,
                displayedMeals[idx].complexity,
                displayedMeals[idx].affordability,
                removeMeal);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
