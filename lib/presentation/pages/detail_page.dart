import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/data/models/restaurant.dart';
import 'package:mauzy_food/presentation/widgets/drink_menu.dart';
import 'package:mauzy_food/presentation/widgets/food_menu.dart';

import '../../bloc/detail_restaurant/detail_restaurant_bloc.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context
        .read<DetailRestaurantBloc>()
        .add(DetailRestaurantEvent.getDetail(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
      builder: (context, state) {
        RestaurantElement? restaurant = state.maybeWhen(
          loaded: (data) {
            return data;
          },
          orElse: () {
            return null;
          },
        );
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail Restaurant'),
          ),
          body: ListView(
            children: [
              Hero(
                tag: restaurant?.pictureId ?? 'urlPicture',
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(restaurant?.pictureId ??
                            'https://placehold.co/500?text=No+Image&font=raleway'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant?.name ?? 'no name',
                      style: context.textTheme.headlineSmall,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          restaurant?.city ?? 'no city',
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          restaurant?.rating.toString() ?? 'no rate',
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(
                      restaurant?.description ?? 'no description',
                      style: context.textTheme.bodyMedium,
                    ),
                    const Divider(),
                    Text(
                      'Menu makanan',
                      style: context.textTheme.headlineSmall,
                    ),
                    FoodMenu(
                      items: restaurant?.menus ??
                          Menus(
                            foods: <Drink>[],
                            drinks: <Drink>[],
                          ),
                    ),
                    const Divider(),
                    Text(
                      'Menu minuman',
                      style: context.textTheme.headlineSmall,
                    ),
                    DrinkMenu(
                      items: restaurant?.menus ??
                          Menus(
                            foods: <Drink>[],
                            drinks: <Drink>[],
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
