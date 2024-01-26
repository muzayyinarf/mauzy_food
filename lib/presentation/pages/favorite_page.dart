import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/list_favorite/list_favorite_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/presentation/pages/favorite_list.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    context.read<ListFavoriteBloc>().add(const ListFavoriteEvent.get());
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          appBar: AppBar(
            title: const Text('Restaurant Favorite'),
          ),
          body: BlocBuilder<ListFavoriteBloc, ListFavoriteState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => _buildLoading(),
              loaded: (data) => FavoriteList(items: data),
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
            middle: Text('Restaurant Favorite'),
          ),
          child: BlocBuilder<ListFavoriteBloc, ListFavoriteState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => _buildLoading(),
                loaded: (data) => FavoriteList(items: data),
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
