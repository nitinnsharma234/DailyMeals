import 'package:delimeals/dummy_data.dart';
import 'package:delimeals/screens/FiltersScreen.dart';
import 'package:delimeals/screens/bottomNavigationBar_Screen.dart';
import 'package:delimeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:delimeals/screens/meal_details_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
     Map<String, bool > _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal>_availableMeals =DUMMY_MEALS;
  void _setFilters(Map <String, bool > filterData){
      setState(() {
        _filters=filterData;
        _availableMeals=DUMMY_MEALS.where((meal) {
            if( _filters['gluten']! &&  !meal.isGlutenFree)
              {
                return false;
              }
            if( _filters['lactose']! &&  !meal.isLactoseFree){
              return false;
            }
            if( _filters['vegan']! &&  !meal.isVegan){
              return false;
            }
            if( _filters['vegetarian']! &&  !meal.isVegetarian){
              return false;
            }
            return true;
        }).toList();
      });
  }
  void _toggleFavourites(String mealId)
  {
      final index = _favouriteMeals.indexWhere((meal) => meal.id==mealId);
      if (index>=0)
        {
          setState(() {
            _favouriteMeals.removeAt(index);
          });
        }
      else{
        setState(() {
          _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
        });
      }
  }
  bool _isMealFavourite(String mealId)
  {
    return _favouriteMeals.any((meal) => meal.id==mealId);
  }
  List<Meal>_favouriteMeals=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' DailyMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 220, 210, 1),
          primaryColor: Colors.amber,
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: Colors.amber,
              primary: Colors.redAccent,
            ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodySmall: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleSmall: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),

      initialRoute: '/',
      routes: {
        '/':(context) =>  BottomNavBar(_favouriteMeals),
        '/category-meals': (context) =>  CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>  MealDetailScreen(_toggleFavourites,_isMealFavourite),
        FiltersScreen.routeName:(context)=> FiltersScreen(_filters,_setFilters),
      },
      //onGenerateRoute: (settings){
       // print(settings.arguments);
       /* if (settings.name=='/meal-detail')
          {
            return  MaterialPageRoute(builder: (ctx)=>CategoriesScreen());
          }
        else if (settings.name ='/meal-ingredients')
          {
            return MaterialPageRoute(builder:(ctx)=>MealIngredients() );
          }
        return MaterialPageRoute(builder: (ctx)=>ReturnDefaultPage());*/
    //  },
     /* onUnknownRoute: (settings){
        *//* what happens if route is not in routes list and after onGenerateRoute not found ,
        onUnknownRoute and it's like pageNotFound error*//*
      }*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen();
  }
}
