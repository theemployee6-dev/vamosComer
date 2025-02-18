import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/create_section_container.dart';
import '../components/create_section_title.dart';
import '../models/meal.dart';
import '../provider/meal_provider.dart';
import '../utils/size_constants.dart';
import '../utils/texts_constants.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: Hero(
                  tag: meal.title,
                  child: CachedNetworkImage(
                    imageUrl: meal.imageUrl,
                    filterQuality: FilterQuality.high,
                    cacheKey: meal.id,
                    maxHeightDiskCache: 600,
                    maxWidthDiskCache: 600,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    fit: BoxFit.cover,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    fadeInDuration: const Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            CreateSectionTitle(title: TextsConstants.textIngredientes),

            CreateSectionContainer(
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SizeConstants.paddingHorizontal,
                        vertical: SizeConstants.paddingVertical,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),
            CreateSectionTitle(title: TextsConstants.textModoDeFazer),
            CreateSectionContainer(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(meal.steps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          mealProvider.isFavorite(meal)
              ? Icons.favorite
              : Icons.favorite_border,
        ),
        onPressed: () => mealProvider.toggleFavorite(meal),
      ),
    );
  }
}
