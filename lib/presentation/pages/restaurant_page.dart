import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/list_restaurant/list_restaurant_bloc.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import 'restaurant_list.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

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
      body: BlocBuilder<ListRestaurantBloc, ListRestaurantState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => _buildLoading(),
          loaded: (data) => RestaurantList(items: data),
          error: (message) => _buildError(message),
          orElse: () => _buildLoading(),
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade100,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Restaurant'),
      ),
      child: BlocBuilder<ListRestaurantBloc, ListRestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => _buildLoading(),
            loaded: (data) => RestaurantList(items: data),
            error: (message) => _buildError(message),
            orElse: () => _buildLoading(),
          );
        },
      ),
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
