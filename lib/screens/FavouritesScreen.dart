import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  List<Meal>favouriteMeal;

  FavouriteScreen(this.favouriteMeal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favouriteMeal.isEmpty ? const Center(
        child: Text("You have no favourites yet - start adding some"),
    ): ListView.builder(
      itemBuilder: (ctx, idx) {
        return MealItem(
            favouriteMeal
[idx].id,
            favouriteMeal
[idx].title,
            favouriteMeal
[idx].imageUrl,
            favouriteMeal
[idx].duration,
            favouriteMeal
[idx].complexity,
            favouriteMeal
[idx].affordability,

        );
      },
      itemCount: favouriteMeal
.length,
    );
  }
}
