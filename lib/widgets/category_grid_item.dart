import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final void Function({required BuildContext context,required String title,required Category category}) onSelect;
  const CategoryItem({super.key,required this.category,required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>onSelect(title:category.title,category:category,context:context,),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 12,vertical:13),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9),
        ],begin: Alignment.topLeft,end: Alignment.bottomRight),),
        child:Text(category.title,style:Theme.of(context).textTheme.titleLarge!.copyWith(
          color:Theme.of(context).colorScheme.onBackground
        ),),
        // child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
      ),
    );
  }
}

