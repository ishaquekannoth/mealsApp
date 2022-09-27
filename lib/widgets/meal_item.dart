

import 'package:flutter/material.dart';
import 'package:udemy/model/meal.dart';
import 'package:udemy/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final void Function(String) removeItem;

  const MealItem(
      {required this.title,
      required this.id,
      required this.duration,
      required this.imageUrl,
      required this.affordability,
      required this.complexity,
      required this.removeItem,
      super.key});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectMeal(context)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      width: 300,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text("$duration min")
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText)
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
