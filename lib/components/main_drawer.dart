import 'package:flutter/material.dart';
import 'package:vamoscomer/components/drawer_item.dart';
import 'package:vamoscomer/utils/size_constants.dart';
import 'package:vamoscomer/utils/texts_constants.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120.0,
              width: double.infinity,
              padding: const EdgeInsets.all(SizeConstants.textSize20),
              color: Theme.of(context).colorScheme.secondary,
              alignment: Alignment.bottomRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  TextsConstants.textDrawerVamosComer,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConstants.textSize20),

            DrawerItem(
              icon: Icons.restaurant,
              label: TextsConstants.textDrawerRefeicoes,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.settings),
            ),
            DrawerItem(
              icon: Icons.settings,
              label: TextsConstants.textMenuConfiguracoes,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
