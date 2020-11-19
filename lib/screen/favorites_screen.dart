import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text("You have no favorites."));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final c = favoriteMeals[index];
          return MealItem(
            id: c.id,
            title: c.title,
            imageUrl: c.imageUrl,
            duration: c.duration,
            affordability: c.affordability,
            complexity: c.complexity,
            //removeItem: _removeMeal,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
