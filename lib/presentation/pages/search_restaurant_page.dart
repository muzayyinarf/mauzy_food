import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/search_restaurant/search_restaurant_bloc.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import 'package:mauzy_food/presentation/pages/search_restaurant_list.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text('Search Restaurant')),
      body: _buildList(),
    );
  }

  Widget _buildIos(context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade100,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Search Restaurant'),
      ),
      child: SafeArea(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SearchWidget(
            onSubmitted: (value) {
              context
                  .read<SearchRestaurantBloc>()
                  .add(SearchRestaurantEvent.doSearch(
                    value.trim(),
                  ));
            },
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
