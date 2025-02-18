import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vamoscomer/utils/texts_constants.dart';

import '../components/meal_item.dart';
import '../models/category.dart';
import '../state/meal_provider.dart';
import '../utils/size_constants.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals =
        mealProvider.availableMeals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body:
          categoryMeals.isEmpty
              ? const Center(
                child: Text(
                  TextsConstants.textNenhumaRefeicaoEncontradaParaEstaCategoria,
                  style: TextStyle(fontSize: SizeConstants.textSize16),
                ),
              )
              : Center(
                child: ListView.builder(
                  itemCount: categoryMeals.length,
                  itemBuilder: (ctx, index) {
                    return MealItem(categoryMeals[index]);
                  },
                ),
              ),
    );
  }
}
