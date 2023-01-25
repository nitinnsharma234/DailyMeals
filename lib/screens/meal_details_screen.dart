import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName='/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('The meal !!'),);
  }
}
