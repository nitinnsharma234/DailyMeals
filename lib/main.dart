import 'package:delimeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/category_meals_screen.dart';
import 'package:delimeals/screens/meal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' DailyMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 220, 210, 1),
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
        '/':(context) => const TabsScreen(),
        '/category-meals': (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
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
