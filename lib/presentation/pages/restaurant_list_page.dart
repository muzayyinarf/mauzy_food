import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

import '../../bloc/restaurant/restaurant_bloc.dart';
import '../widgets/restaurant_menu.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Restaurant'),
      ),
      body: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
              initial: () => const Text('data'),
              loading: () => const CircularProgressIndicator(),
              loaded: (data) => RestaurantMenu(items: data),
              orElse: () => const Text('No data'));
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade100,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Restaurant'),
      ),
      child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
              initial: () => const Text('data'),
              loading: () => const CircularProgressIndicator(),
              loaded: (data) => RestaurantMenu(items: data),
              orElse: () => const Text('No data'));
        },
      ),
    );
  }
}
