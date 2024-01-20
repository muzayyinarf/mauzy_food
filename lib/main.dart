import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/list_restaurant/list_restaurant_bloc.dart';
import 'package:mauzy_food/bloc/restaurant/restaurant_bloc.dart';
import 'package:mauzy_food/bloc/search_restaurant/search_restaurant_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import 'package:mauzy_food/routes/router.dart';
import 'bloc/detail_restaurant/detail_restaurant_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RestaurantBloc(),
        ),
        BlocProvider(
          create: (context) => ListRestaurantBloc(RestaurantRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              DetailRestaurantBloc(RestaurantRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              SearchRestaurantBloc(RestaurantRemoteDatasource()),
        ),
      ],
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  MaterialApp _buildAndroid(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mauzy Food',
      theme: getAndroidTheme(context),
      routerConfig: router,
    );
  }

  CupertinoApp _buildIos(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mauzy Food',
      theme: getIosTheme(context),
      routerConfig: router,
    );
  }
}
