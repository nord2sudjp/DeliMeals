import 'package:DeliMeals/screen/categories_screen.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _isFirstTime = false;

  @override
  void initState() {
    super.initState();
    // context is not available, too early.
  }

  @override
  void didChangeDependencies() {
    if (!_isFirstTime) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final id = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _isFirstTime = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:
          // Center(
          //   child: Text('The Recipies for The Category'),
          // )
          ListView.builder(
        itemBuilder: (ctx, index) {
          final c = displayedMeals[index];
          return MealItem(
            id: c.id,
            title: c.title,
            imageUrl: c.imageUrl,
            duration: c.duration,
            affordability: c.affordability,
            complexity: c.complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
