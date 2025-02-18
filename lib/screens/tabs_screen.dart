import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/main_drawer.dart';
import '../state/meal_provider.dart';
import '../utils/texts_constants.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém o MealProvider para acessar o estado
    final mealProvider = Provider.of<MealProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:
            mealProvider.screens[mealProvider.selectedTabIndex][TextsConstants
                .mapNamesTitle],
      ),
      drawer: MainDrawer(),
      body:
          mealProvider.screens[mealProvider.selectedTabIndex][TextsConstants
              .mapNamesScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: mealProvider.selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: mealProvider.selectedTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: TextsConstants.bottomNavigationBarIconLabelCategorias,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: TextsConstants.bottomNavigationBarIconLabelFavoritos,
          ),
        ],
      ),
    );
  }
}
