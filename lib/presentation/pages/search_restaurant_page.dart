import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/search_restaurant/search_restaurant_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import 'package:mauzy_food/presentation/pages/search_restaurant_list.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../widgets/search_widget.dart';

class SearchRestaurantPage extends StatefulWidget {
  const SearchRestaurantPage({super.key});

  @override
  State<SearchRestaurantPage> createState() => _SearchRestaurantPageState();
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          appBar: AppBar(title: const Text('Search Restaurant')),
          body: _buildList(),
        );
      },
    );
  }

  Widget _buildIos(context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Search Restaurant'),
          ),
          child: SafeArea(
            child: _buildList(),
          ),
        );
      },
    );
  }

  Widget _buildList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchWidget(
            onSubmitted: (value) {
              context
                  .read<SearchRestaurantBloc>()
                  .add(SearchRestaurantEvent.doSearch(
                    value.trim(),
                  ));
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchRestaurantBloc, SearchRestaurantState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildLoading(),
                loaded: (data) {
                  if (data.restaurants.isEmpty) {
                    return const Center(
                      child: Text('Restaurant tidak ditemukan'),
                    );
                  }
                  return SearchRestaurantList(items: data);
                },
                error: (message) => _buildError(message),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ],
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
        style: TextStyle(color: redColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
