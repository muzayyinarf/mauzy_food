import 'package:flutter/material.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/data/models/response/detail_restaurant_response_model.dart';
import 'package:mauzy_food/presentation/widgets/neumorphic_button.dart';

class DrinkMenu extends StatelessWidget {
  final Menus items;
  const DrinkMenu({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.drinks.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = items.drinks[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: NeumorphicButton(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    menu.name,
                    style: context.textTheme.labelLarge,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
