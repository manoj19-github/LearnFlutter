import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.model.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/filters_screen.dart';
import 'package:mealsapp/screens/meals.screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabScreenWidget extends StatefulWidget {
  const TabScreenWidget({super.key});

  @override
  State<TabScreenWidget> createState() => _TabScreenWidgetState();
}

class _TabScreenWidgetState extends State<TabScreenWidget> {
  int _selectedPageIndex = 0;
  final List<Meal> _favourites = [];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void setScreenHandler(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
    }
  }

  void _toggleMealFavSTatus(Meal meal) {
    final isExists = _favourites.contains(meal);
    if (isExists) {
      setState(() {
        _favourites.remove(meal);
      });
      showInfoMessage("Removed from favourites");
    } else {
      setState(() {
        _favourites.add(meal);
      });
      showInfoMessage("Marked as favourite");
    }
    // print(_favourites);
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleFavourites: _toggleMealFavSTatus);
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          meals: _favourites, onToggleFavourites: _toggleMealFavSTatus);
      activePageTitle = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle), actions: []),
      drawer: MainDrawer(
        onSelectScreen: setScreenHandler,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Favourites'),
          ]),
    );
  }
}
