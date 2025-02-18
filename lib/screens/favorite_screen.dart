import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/meal_item.dart';
import '../provider/meal_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);

    if (mealProvider.favoriteMeals.isEmpty) {
      return Center(child: Text('Minhas Refeições Favoritas'));
    } else {
      return ListView.builder(
        itemCount: mealProvider.favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(mealProvider.favoriteMeals[index]);
        },
      );
    }
  }
}
