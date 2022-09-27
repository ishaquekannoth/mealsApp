import 'package:flutter/material.dart';
import 'package:udemy/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key, this.setFilters, required this.currentFilter});
  static const routeName = '/filters';
  Function? setFilters;
  Map<String, bool> currentFilter;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    _isGlutenFree = widget.currentFilter['glutenFree']!;
    _isVegan = widget.currentFilter['vegan']!;
    _isVegetarian = widget.currentFilter['vegetarian']!;
    _isLactoseFree = widget.currentFilter['lactoseFree']!;
    super.initState();
  }

  bool _isGlutenFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;

  bool _isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: [
          IconButton(
              onPressed: () {
                final data = {
                  'glutenFree': _isGlutenFree,
                  'lactoseFree': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                  'vegan': _isVegan
                };
                widget.setFilters!(data);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListWidget(
                title: 'Gluten free',
                subtitle: 'Only include glutene free',
                currentValue: _isGlutenFree,
                updateValue: (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                },
              ),
              _buildSwitchListWidget(
                title: 'Lactose free',
                subtitle: 'Only include Lactose free',
                currentValue: _isLactoseFree,
                updateValue: (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                },
              ),
              _buildSwitchListWidget(
                title: 'Vegetarian',
                subtitle: 'Only include Vegetarian',
                currentValue: _isVegetarian,
                updateValue: (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                },
              ),
              _buildSwitchListWidget(
                title: 'Vegan',
                subtitle: 'Only include Vegan',
                currentValue: _isVegan,
                updateValue: (value) {
                  setState(() {
                    _isVegan = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  SwitchListTile _buildSwitchListWidget(
      {required String title,
      required String subtitle,
      required bool currentValue,
      required Function(bool) updateValue}) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }
}
