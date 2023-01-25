import 'package:flutter/material.dart';
import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
                categoryMeals[idx].id,
                categoryMeals[idx].title,
                categoryMeals[idx].imageUrl,
                categoryMeals[idx].duration,
                categoryMeals[idx].complexity,
                categoryMeals[idx].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
