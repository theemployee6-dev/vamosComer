import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/settings.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';
import '../utils/texts_constants.dart';

class MealProvider extends ChangeNotifier {
  MealProvider() {
    _loadFavorites(); // Carrega os favoritos ao inicializar
  }

  // Lista de todas as refeições disponíveis
  final List<Meal> _allMeals = dummyMeals;

  // Lista de refeições filtradas com base nas configurações
  List<Meal> _availableMeals = dummyMeals;

  // Lista de refeições favoritas
  final List<Meal> _favoriteMeals = [];

  // Chave para salvar/recuperar os favoritos no SharedPreferences
  static const String _favoritesKey = 'favorite_meals';

  // Configurações atuais
  Settings _settings = Settings();

  //Selected Index
  int _selectedTabIndex = 0;

  // Lista de telas disponíveis na navegação inferior
  final List<Map<String, Widget>> _screens = [
    {
      TextsConstants.mapNamesTitle: Text(TextsConstants.textListaDeCategorias),
      TextsConstants.mapNamesScreen: CategoriesScreen(),
    },
    {
      TextsConstants.mapNamesTitle: Text(TextsConstants.textMeusFavoritos),
      TextsConstants.mapNamesScreen: const FavoriteScreen(),
    },
  ];

  // Getters para acessar os dados
  int get selectedTabIndex => _selectedTabIndex;
  List<Meal> get allMeals => _allMeals;
  List<Meal> get availableMeals => _availableMeals;
  List<Meal> get favoriteMeals => _favoriteMeals;
  List<Map<String, Widget>> get screens => _screens;
  Settings get settings => _settings;

  //Função que passa o indice selecionado
  void selectTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  // Filtra as refeições com base nas configurações
  void filterMeals() {
    _availableMeals =
        allMeals.where((meal) {
          final bool filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final bool filterLactose =
              settings.isLactoseFree && !meal.isLactoseFree;
          final bool filterVegan = settings.isVegan && !meal.isVegan;
          final bool filterVegetarian =
              settings.isVegetarian && !meal.isVegetarian;

          return !filterGluten &&
              !filterLactose &&
              !filterVegan &&
              !filterVegetarian;
        }).toList();
    notifyListeners();
  }

  // Atualiza as configurações e refiltra as refeições
  void updateSettings(Settings newSettings) {
    _settings = newSettings;
    filterMeals();
    notifyListeners(); // Refiltra as refeições após atualizar as configurações
  }

  // Adiciona ou remove uma refeição dos favoritos
  void toggleFavorite(Meal meal) async {
    _favoriteMeals.contains(meal)
        ? _favoriteMeals.remove(meal)
        : _favoriteMeals.add(meal);
    notifyListeners();
    await _saveFavorites(); // Salva os favoritos após a alteração
  }

  // Verifica se uma refeição está nos favoritos
  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  // Salva a lista de IDs das refeições favoritas no SharedPreferences
  Future<void> _saveFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favoriteIds =
        _favoriteMeals.map((meal) => meal.id).toList();
    await prefs.setStringList(_favoritesKey, favoriteIds);
  }

  // Carrega a lista de IDs das refeições favoritas do SharedPreferences
  Future<void> _loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favoritesIds = prefs.getStringList(_favoritesKey) ?? [];

    final allMeals = dummyMeals;

    _favoriteMeals.clear();

    for (String id in favoritesIds) {
      final meal = allMeals.firstWhere(
        (meal) => meal.id == id,
        orElse:
            () => Meal(
              id: '',
              categories: [],
              title: '',
              imageUrl: '',
              ingredients: [],
              steps: [],
              duration: 0,
              isGlutenFree: false,
              isLactoseFree: false,
              isVegan: false,
              isVegetarian: false,
              complexity: Complexity.none,
              cost: Cost.none,
            ),
      );
      if (meal.id.isNotEmpty) {
        _favoriteMeals.add(meal);
      }
    }
    notifyListeners();
  }
}
