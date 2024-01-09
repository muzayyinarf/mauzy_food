import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/drink_menu.dart';
import 'package:mauzy_food/presentation/widgets/food_menu.dart';

import '../../bloc/detail_restaurant/detail_restaurant_bloc.dart';
import '../../data/models/restaurant.dart';
import '../widgets/platform_widget.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

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
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
      ),
      body: BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
        builder: (context, state) {
          RestaurantElement? restaurant = state.maybeWhen(
            loaded: (data) {
              return data;
            },
            orElse: () {
              return null;
            },
          );
          if (restaurant == null) {
            return const CircularProgressIndicator();
          }
          return _buildContent(context, restaurant);
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: primaryColor,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail Restaurant'),
      ),
      child: BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
        builder: (context, state) {
          RestaurantElement? restaurant = state.maybeWhen(
            loaded: (data) {
              return data;
            },
            orElse: () {
              return null;
            },
          );
          if (restaurant == null) {
            return const CircularProgressIndicator();
          }
          return _buildContent(context, restaurant);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, RestaurantElement restaurant) {
    return ListView(
      children: [
        Hero(
          tag: restaurant.pictureId,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(restaurant.pictureId),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: context.textTheme.headlineSmall,
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    restaurant.city,
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
                    restaurant.rating.toString(),
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
              const Divider(),
              Text(
                restaurant.description,
                style: context.textTheme.bodyMedium,
              ),
              const Divider(),
              Text(
                'Menu makanan',
                style: context.textTheme.headlineSmall,
              ),
              FoodMenu(
                items: restaurant.menus,
              ),
              // const Divider(),
              Text(
                'Menu minuman',
                style: context.textTheme.headlineSmall,
              ),
              DrinkMenu(
                items: restaurant.menus,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
