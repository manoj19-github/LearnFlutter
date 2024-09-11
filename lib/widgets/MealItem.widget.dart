import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.model.dart';
import 'package:mealsapp/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(BuildContext context, Meal meal) onMealSelect;
  const MealItem({super.key, required this.meal,required this.onMealSelect});

  String get ComplexityText{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
    
  }
  String get AffordabilityText{
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap:()=> onMealSelect(context , meal),
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit:BoxFit.cover,
            height:250,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Column(children: [
                Text(
                  meal.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  MealItemTrait(icon: Icons.schedule, label:meal.duration.toString()+" min"),
                  MealItemTrait(icon: Icons.work, label:ComplexityText),
                   MealItemTrait(icon: Icons.attach_money, label:AffordabilityText),

                ],)
               
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
