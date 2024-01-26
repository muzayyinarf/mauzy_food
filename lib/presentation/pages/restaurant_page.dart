import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/list_restaurant/list_restaurant_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import '../../bloc/theme/theme_bloc.dart';
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
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
      },
    );
  }

  Widget _buildIos(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
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
      },
    );
  }

  Widget _buildLoading() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Center(
          child: CircularProgressIndicator(
            color: state.isDarkmode ? blueColor : purpleColor,
          ),
        );
      },
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
