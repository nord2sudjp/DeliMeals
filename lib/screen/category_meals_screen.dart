import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;

  // CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:
          // Center(
          //   child: Text('The Recipies for The Category'),
          // )
          ListView.builder(
        itemBuilder: (ctx, index) {
          final c = categoryMeals[index];
          return MealItem(
            id: c.id,
            title: c.title,
            imageUrl: c.imageUrl,
            duration: c.duration,
            affordability: c.affordability,
            complexity: c.complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
