import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mauzy_food/bloc/add_review/add_review_bloc.dart';
import 'package:mauzy_food/bloc/list_favorite/list_favorite_bloc.dart';
import 'package:mauzy_food/bloc/list_restaurant/list_restaurant_bloc.dart';
import 'package:mauzy_food/bloc/scheduling/scheduling_bloc.dart';
import 'package:mauzy_food/bloc/search_restaurant/search_restaurant_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/data/datasources/favorite_local_datasource.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import 'package:mauzy_food/routes/router.dart';
import 'package:mauzy_food/utils/dark_mode_preference.dart';
import 'package:mauzy_food/utils/notification_helper.dart';
import 'package:mauzy_food/utils/subscription_preference.dart';
import 'bloc/detail_restaurant/detail_restaurant_bloc.dart';
import 'utils/background_services.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //notification
  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  //Alarm
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    AndroidAlarmManager.initialize();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
        BlocProvider(
          create: (context) => AddReviewBloc(RestaurantRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ListFavoriteBloc(FavoriteLocalDatasource()),
        ),
        BlocProvider(
          create: (context) => SchedulingBloc(SubscriptionPreference()),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(DarkModePreference()),
        ),
      ],
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    context.watch<ThemeBloc>().add(const ThemeEvent.getTheme());
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mauzy Food',
          theme: getAndroidTheme(context),
          darkTheme: getDarkModeTheme(context),
          themeMode: state.isDarkmode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router);
    });
  }

  Widget _buildIos(BuildContext context) {
    context.watch<ThemeBloc>().add(const ThemeEvent.getTheme());
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return CupertinoApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mauzy Food',
          theme: state.isDarkmode
              ? getIosDarkTheme(context)
              : getIosTheme(context),
          routerConfig: router);
    });
  }
}
