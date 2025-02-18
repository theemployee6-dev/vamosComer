import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/create_switch.dart';
import '../components/main_drawer.dart';
import '../state/meal_provider.dart';
import '../utils/size_constants.dart';
import '../utils/texts_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);
    final settings = mealProvider.settings;
    return Scaffold(
      appBar: AppBar(title: Text(TextsConstants.textMenuConfiguracoes)),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(SizeConstants.paddingAll),
            child: Text(
              TextsConstants.textMenuConfiguracoes,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CreateSwitch(
                  title: TextsConstants.textTitleSwitcherSemGluten,
                  subtitle:
                      TextsConstants
                          .textSubTitleSwitcherApenasRefeicoesSemGluten,
                  value: settings.isGlutenFree,
                  onChanged:
                      (value) => mealProvider.updateSettings(
                        settings.copyWith(isGlutenFree: value),
                      ),
                ),

                CreateSwitch(
                  title: TextsConstants.textTitleSwitcherSemLactose,
                  subtitle:
                      TextsConstants
                          .textSubTitleSwitcherApenasRefeicoesSemLactose,
                  value: settings.isLactoseFree,
                  onChanged:
                      (value) => mealProvider.updateSettings(
                        settings.copyWith(isLactoseFree: value),
                      ),
                ),

                CreateSwitch(
                  title: TextsConstants.textTitleSwitcherSomenteVegano,
                  subtitle:
                      TextsConstants
                          .textSubTitleSwitcherApenasRefeicoesParaVegetarianos,
                  value: settings.isVegan,
                  onChanged:
                      (value) => mealProvider.updateSettings(
                        settings.copyWith(isVegan: value),
                      ),
                ),

                CreateSwitch(
                  title: TextsConstants.textTitleSwitcherSomenteVegetariano,
                  subtitle:
                      TextsConstants
                          .textSubTitleSwitcherApenasRefeicoesParaVegetarianos,
                  value: settings.isVegetarian,
                  onChanged:
                      (value) => mealProvider.updateSettings(
                        settings.copyWith(isVegetarian: value),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
