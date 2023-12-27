import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/restaurant/restaurant_bloc.dart';

import '../widgets/restaurant_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context
        .read<RestaurantBloc>()
        .add(const RestaurantEvent.getAllRestaurant());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ));
  }
}
