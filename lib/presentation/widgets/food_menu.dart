import 'package:flutter/material.dart';
import 'package:mauzy_food/common/extensions.dart';

import '../../data/models/restaurant.dart';

class FoodMenu extends StatelessWidget {
  final Menus items;
  const FoodMenu({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.foods.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = items.foods[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text(
                menu.name,
                style: context.textTheme.labelLarge,
              ),
            ),
          );
        },
      ),
    );
  }
}
