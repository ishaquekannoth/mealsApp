import 'package:flutter/material.dart';
import 'package:udemy/widgets/category_item.dart';
import 'package:udemy/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     
       GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((categoryData) => CategoryItem(
                  id: categoryData.id,
                  title: categoryData.title,
                  color: categoryData.color))
              .toList());    
     
    
  }
}
