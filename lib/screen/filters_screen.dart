import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters["gluten"];
    _lactoseFree = widget.filters["lactose"];
    _vegan = widget.filters["vegan"];
    _vegetarian = widget.filters["vegetarian"];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              _buildSwitchListTile(
                  'Gluten-free', "Only include gluten free", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Lactose-free', "Only include lactose free", _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', "Only include vegetarian", _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', "Only include vegan", _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ]),
          ),
        ]),
      ),
    );
  }
}
