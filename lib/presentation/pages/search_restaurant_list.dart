import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/global_variables.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/data/models/response/search_restaurant_response_model.dart';

import 'package:mauzy_food/routes/names_route.dart';

import '../widgets/neumorphic_button.dart';

class SearchRestaurantList extends StatelessWidget {
  final SearchRestaurantResponseModel items;
  const SearchRestaurantList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
    return ListView.builder(
        itemCount: items.restaurants.length,
        itemBuilder: (context, index) {
          final item = items.restaurants[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: NeumorphicButton(
              onTap: () {
                context.goNamed(Routes.detail, pathParameters: {'id': item.id});
              },
              child: Material(
                color: isDarkMode ? backgroundDarkModeColor : backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Hero(
                      tag: item.pictureId,
                      child: Container(
                        width: 120,
                        height: 90,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  GlobalVariables.image.small(item.pictureId)),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: isDarkMode ? whiteColor : Colors.black,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: isDarkMode ? blueColor : purpleColor,
                                ),
                                2.sw,
                                Text(
                                  item.city,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color:
                                        isDarkMode ? whiteColor : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: isDarkMode ? blueColor : purpleColor,
                                ),
                                2.sw,
                                Text(
                                  '${item.rating}',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    color:
                                        isDarkMode ? whiteColor : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
