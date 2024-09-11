
import 'package:flutter/material.dart';
import 'package:mealsapp/data/category.data.dart';
import 'package:mealsapp/models/category.model.dart';
import 'package:mealsapp/models/meal.model.dart';
import 'package:mealsapp/screens/meals.screen.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  void Function (Meal meal)  onToggleFavourites;
   CategoriesScreen({super.key,required this.onToggleFavourites});
  void _selectCategory({required BuildContext context,required Category category,required String title}){

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealsScreen(title:title,onToggleFavourites:onToggleFavourites, meals: dummyMeals.where((self)=>self.categories.contains(category.id),).toList(),)),);
  }
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:3/2,crossAxisSpacing: 20,mainAxisSpacing: 20 ),
        children: [
          ...avilableCategories.map((catergory)=>CategoryItem(category: catergory,onSelect:_selectCategory,)).toList()
       
          
        ],);
  }
}