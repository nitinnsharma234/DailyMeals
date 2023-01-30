import 'package:delimeals/widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "FiltersScreen";
  final Function(Map<String, bool>) saveFilters;
  final Map<String,bool> filters ;
  const FiltersScreen(this.filters,this.saveFilters, {Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

Widget buildSwitchTile(String title, String description, bool currentValue,
    Function(bool) updateValue) {
  return SwitchListTile(
    value: currentValue,
    onChanged: updateValue,
    title: Text(title),
    subtitle: Text(description),
    activeColor: Colors.redAccent,
    activeTrackColor: Colors.redAccent.shade100,
  );
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;
  var _vegan = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree=widget.filters['gluten']!;
    _lactoseFree=widget.filters['lactose']!;
    _vegetarian=widget.filters['vegetarian']!;
    _vegan =widget.filters['vegan']!;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                    'lactose': _lactoseFree
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection!!",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchTile("Gluten Free", "Only include Gluten-Free Meals",
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchTile(
                    "Lactose Free",
                    "Only include Lactose-Free Meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchTile(
                    "Vegetarian", "Only Vegetarian Meals", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchTile("Lactose Free", "Only Vegan Meals", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ))
          ],
        ),
      ),
    );
  }
}
