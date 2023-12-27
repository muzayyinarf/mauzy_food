import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/restaurant/restaurant_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
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
          create: (context) => DetailRestaurantBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Mauzy Food',
        theme: getThemedata(context),
        routerConfig: router,
      ),
    );
  }
}
