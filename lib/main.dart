import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy/dummy_data.dart';
import 'package:udemy/model/meal.dart';
import 'package:udemy/screens/category_meals_screen.dart';
import 'package:udemy/screens/category_screen.dart';
import 'package:udemy/screens/filters_screen.dart';
import 'package:udemy/screens/meal_details_screen.dart';
import 'package:udemy/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filteredList = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      filteredList = filterData;
      availableMeals = DUMMY_MEALS.where((element) {
        if (filteredList['glutenFree']! && !element.isGlutenFree) {
          return false;
        }
        if (filteredList['lactoseFree']! && !element.isLactoseFree) {
          return false;
        }
        if (filteredList['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        if (filteredList['vegan']! && !element.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          fontFamily: GoogleFonts.raleway().fontFamily,
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: const Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.robotoCondensed().fontFamily))),
      // home: const CategoryScreen(),
      initialRoute: '/',
      routes: {
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: availableMeals,
            ),
        '/': (context) => const TabsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(setFilters: _setFilter,currentFilter: filteredList,)
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const CategoryScreen(),
      ),
    );
  }
}
