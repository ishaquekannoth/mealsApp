import 'package:flutter/material.dart';
import 'package:udemy/model/meal.dart';
import 'package:udemy/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  CategoryMealsScreen({super.key,this.availableMeals});
  static const routeName = '/category-meals';
  List<Meal>? availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var isLoaded = false;

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((element) {
        return element.id == mealId;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (!isLoaded) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals?.where((element) {
        return element.categoryIds.contains(categoryId);
      }).toList();
      isLoaded = true;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  // final String Function(Widget,String) cat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: displayedMeals!.length,
            itemBuilder: (context, index) {
              return (MealItem(
                removeItem: removeMeal,
                title: displayedMeals![index].title,
                imageUrl: displayedMeals![index].imageUrl,
                affordability: displayedMeals![index].affordability,
                complexity: displayedMeals![index].complexity,
                duration: displayedMeals![index].duration,
                id: displayedMeals![index].id,
              ));
            }));
  }
}
