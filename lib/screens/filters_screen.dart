import 'package:flutter/material.dart';
import 'package:mealsapp/screens/tabsScreen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterState = false;
  var _veganFilterState = false;
  var _vegetarianFilterState = false;
  var _lactoseFreeFilterState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        drawer: MainDrawer(
          onSelectScreen: (identifier) {
            Navigator.of(context).pop();
            if (identifier == 'meals') {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => TabScreenWidget(),
                ),
              );
            }
            // Navigator.of(context).pushReplacementNamed(identifier);
          },
        ),
        body: Column(children: [
          SwitchListTile(
              value: _glutenFreeFilterState,
              title: Text("Gluten Free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              subtitle: Text("Only include gluten free meals",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterState = isChecked;
                });
              })
        ]));
  }
}
