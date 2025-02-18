import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vamoscomer/provider/meal_provider.dart';
import 'package:vamoscomer/utils/texts_constants.dart';
import 'package:vamoscomer/utils/theme.dart';

import 'utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MealProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TextsConstants.materialAppTitle,
        theme: ThemeApp.themeApp,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
