import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/global_variables.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/data/models/response/detail_restaurant_response_model.dart';
import 'package:mauzy_food/presentation/widgets/drink_menu.dart';
import 'package:mauzy_food/presentation/widgets/food_menu.dart';

import '../../bloc/detail_restaurant/detail_restaurant_bloc.dart';
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
        .add(DetailRestaurantEvent.get(widget.id));
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
          return state.maybeWhen(
            loading: () => _buildLoading(),
            loaded: (data) => _buildContent(data),
            error: (message) => _buildError(message),
            orElse: () => _buildLoading(),
          );
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
        builder: (context, state) => state.maybeWhen(
          loading: () => _buildLoading(),
          loaded: (data) => _buildContent(data),
          error: (message) => _buildError(message),
          orElse: () => _buildLoading(),
        ),
      ),
    );
  }

  Widget _buildContent(DetailRestaurantResponseModel restaurant) {
    return ListView(
      children: [
        Hero(
          tag: restaurant.restaurant.pictureId,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  GlobalVariables.image.large(restaurant.restaurant.pictureId),
                ),
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
                restaurant.restaurant.name,
                style: context.textTheme.headlineSmall,
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    restaurant.restaurant.city,
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
                    restaurant.restaurant.rating.toString(),
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
              const Divider(),
              Text(
                restaurant.restaurant.description,
                style: context.textTheme.bodyMedium,
              ),
              const Divider(),
              Text(
                'Menu makanan',
                style: context.textTheme.headlineSmall,
              ),
              FoodMenu(
                items: restaurant.restaurant.menus,
              ),
              // const Divider(),
              Text(
                'Menu minuman',
                style: context.textTheme.headlineSmall,
              ),
              DrinkMenu(
                items: restaurant.restaurant.menus,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
