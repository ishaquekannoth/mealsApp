import 'package:flutter/material.dart';
import 'package:udemy/model/category_item.dart';
import 'package:udemy/model/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DeliveryMe'),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((categoryData) => CategoryItem(id:categoryData.id ,
                  title: categoryData.title, color: categoryData.color))
              .toList()),
    );
  }
}
