import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/list_restaurant/list_restaurant_bloc.dart';
import 'package:mauzy_food/bloc/scheduling/scheduling_bloc.dart';
import 'package:mauzy_food/main.dart';
import 'package:mauzy_food/presentation/pages/favorite_page.dart';
import 'package:mauzy_food/presentation/pages/restaurant_page.dart';
import 'package:mauzy_food/presentation/pages/search_restaurant_page.dart';
import 'package:mauzy_food/presentation/pages/settings_page.dart';
import 'package:mauzy_food/presentation/widgets/platform_widget.dart';
import 'package:mauzy_food/utils/notification_helper.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../../common/styles.dart';
import '../../utils/background_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.news : Icons.public,
      ),
      label: 'Restaurant',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.search : Icons.search,
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.bookmark : Icons.bookmark,
      ),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.settings : Icons.settings,
      ),
      label: 'Settings',
    ),
  ];
  final List<Widget> _listWidget = [
    const RestaurantPage(),
    const SearchRestaurantPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  final BackgroundService _service = BackgroundService();
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
    _notificationHelper.configureSelectNotificationSubject(context);
    context.read<ListRestaurantBloc>().add(const ListRestaurantEvent.get());
    if (Platform.isAndroid) {
      context.read<SchedulingBloc>().add(const SchedulingEvent.getScheduling());
    }
    port.listen((_) async => await _service.someTask());
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
          body: _listWidget[_bottomNavIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor:
                  state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              selectedItemColor: state.isDarkmode ? blueColor : purpleColor,
              unselectedItemColor: Colors.grey.shade500,
              selectedLabelStyle: textStyle,
              currentIndex: _bottomNavIndex,
              items: _bottomNavBarItems,
              onTap: (selected) {
                setState(() {
                  _bottomNavIndex = selected;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildIos(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CupertinoTabScaffold(
          backgroundColor:
              state.isDarkmode ? backgroundDarkModeColor : backgroundColor,
          tabBar: CupertinoTabBar(
            activeColor: state.isDarkmode ? blueColor : purpleColor,
            items: _bottomNavBarItems,
          ),
          tabBuilder: (context, index) {
            return _listWidget[index];
          },
        );
      },
    );
  }
}
