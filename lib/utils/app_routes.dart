import 'package:flutter/material.dart';
import 'package:vamoscomer/screens/categories_meals_screen.dart';
import 'package:vamoscomer/screens/meal_detail_screen.dart';
import 'package:vamoscomer/screens/settings_screen.dart';
import 'package:vamoscomer/screens/tabs_screen.dart';

class AppRoutes {
  //NAME OF THE ROUTES
  static const home = '/';
  static const categoriesMeals = '/categories-meals';
  static const mealDetail = '/meal-detail';
  static const settings = '/settings';

  // Configuração das rotas
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const TabsScreen(),
    categoriesMeals: (context) => const CategoriesMealsScreen(),
    mealDetail: (context) => const MealDetailScreen(),
    settings: (context) => const SettingsScreen(),
  };
}
