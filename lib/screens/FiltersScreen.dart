import 'package:delimeals/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "FiltersScreen";

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        body: Center(
          child: Text("Meals are filtered here "),
        ),
      ),
    );
  }
}
