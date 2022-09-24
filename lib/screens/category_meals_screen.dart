import 'package:flutter/material.dart';
import 'package:udemy/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({super.key});
  static const routeName = '/category-meals';
  // final String Function(Widget,String) cat;
  // const CategoryMealsScreen(
  //     {required this.categoryId, required this.categoryTitle, super.key});
  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categoryIds.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['title']!),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              return (Text(categoryMeals[index].title));
            }));
  }
}
