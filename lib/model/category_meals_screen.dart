import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen(
      {required this.categoryId, required this.categoryTitle, super.key});
  final String categoryId;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('The reciepes for the category'),
      ),
    );
  }
}
