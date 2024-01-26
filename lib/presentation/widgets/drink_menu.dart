import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/neumorphic_button.dart';

import '../../data/models/menus.dart';

class DrinkMenu extends StatelessWidget {
  final Menus items;
  const DrinkMenu({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
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
                  color: isDarkMode ? backgroundDarkModeColor : backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    menu.name,
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
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
