import 'package:flutter/material.dart';
import 'package:mauzy_food/common/extensions.dart';

import '../../data/models/restaurant.dart';

class DrinkMenu extends StatelessWidget {
  final Menus items;
  const DrinkMenu({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.drinks.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = items.drinks[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text(menu.name, style: context.textTheme.labelLarge),
            ),
          );
        },
      ),
    );
  }
}
