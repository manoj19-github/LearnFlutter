import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/data/category.data.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/meals.screen.dart';
import 'package:mealsapp/screens/tabsScreen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255,131,57,0),
  brightness: Brightness.dark,

  ),
  textTheme: 
   GoogleFonts.latoTextTheme()
  

);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: TabScreenWidget()
    );
  }
  }