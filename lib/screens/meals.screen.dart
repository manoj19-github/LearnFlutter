import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.model.dart';
import 'package:mealsapp/screens/MealDetails.dart';
import 'package:mealsapp/widgets/MealItem.widget.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  void Function (Meal meal)  onToggleFavourites;
  // const MealsScreen({super.key, required this.title});

  MealsScreen({super.key, this.title,required this.meals,required this.onToggleFavourites});
  
void selectMeal(BuildContext context , Meal meal){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MealDetails(meal: meal,onToggleFavourites:onToggleFavourites)));
}
  @override
  Widget build(BuildContext context) {
    
    
    Widget body= Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("No meals found.",style:Theme.of(context).textTheme.headlineMedium!.copyWith(color:Theme.of(context).colorScheme.onBackground),),
          const SizedBox(height: 16,),
          Text("Try selecting a different category. ",style:Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),),
        ],),
      );
   if(meals.isNotEmpty){
       body=  ListView.builder( itemCount:meals.length, itemBuilder: (ctx,index)=>MealItem(meal:meals[index],onMealSelect:selectMeal,),);
    }

    print("title >>>>>>>> ${title}");

    if(title==null || title==""){
          return  body;
    }

    return Scaffold(
      appBar: AppBar(
        title:  Text(title!),
      ),
      body:body
    );
  }
}