import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "FiltersScreen";

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Meals are filtered here "),
        ),
      ),
    );
  }
}
