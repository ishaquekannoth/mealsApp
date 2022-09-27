import 'package:flutter/material.dart';
import 'package:udemy/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return (Container(
        margin: const EdgeInsets.all(10),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge)));
  }

  Widget buildContainer(Widget child) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeVariable = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == routeVariable,
    );
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle('Ingredients', context),
          buildContainer(ListView.builder(
            itemCount: selectedMeal.ingredients.length,
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              );
            },
          )),
          buildSectionTitle("Steps", context),
          buildContainer(ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              );
            },
          )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.delete),
          onPressed: () =>
              Navigator.of(context).pop(selectedMeal.id.toString())),
    );
  }
}
