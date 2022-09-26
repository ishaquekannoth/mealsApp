import 'package:flutter/material.dart';
import 'package:udemy/screens/category_screen.dart';
import 'package:udemy/screens/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void selectPage(int index) {
    setState(() {
      selectedPagesIndex = index;
    });
  }

  List<Map<String, dynamic>> pages = [
    {'page': const CategoryScreen(), 'title': "Category"},
    {'page': const Favourites(), 'title': "Favourites"}
  ];
  int selectedPagesIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(pages[selectedPagesIndex]['title']),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.deepPurple,
            onTap: selectPage,
            currentIndex: selectedPagesIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Category',
                icon: Icon(Icons.category),
              ),
              BottomNavigationBarItem(
                label: 'Favourite',
                icon: Icon(Icons.star),
              ),
            ],
          ),
          body: pages[selectedPagesIndex]['page']
          //const TabBarView(children: [CategoryScreen(), Favourites()]),
          // appBar: AppBar(
          //   title: const Text("meals"),
          //   bottom: const TabBar(tabs: [Icon(Icons.category), Icon(Icons.star)]),
          // ),
          ),
    );
  }
}
