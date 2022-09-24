import 'package:flutter/material.dart';
import 'package:udemy/dummy_data.dart';
import 'package:udemy/widgets/meal_item.dart';

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
              return (MealItem(title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, affordability: categoryMeals[index].affordability, complexity: categoryMeals[index].complexity,duration:categoryMeals[index].duration,id: categoryMeals[index].id,));
            }));
  }
}
