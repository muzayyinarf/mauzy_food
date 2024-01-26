import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/data/models/response/list_restaurant_response_model.dart';
import 'package:mauzy_food/routes/names_route.dart';
import 'package:rxdart/rxdart.dart';

import '../data/models/restaurant.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) async {
      final payload = details.payload;
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  // Fungsi untuk meminta izin notifikasi pada iOS
  void requestIOSPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      ListRestaurantResponseModel restaurant) async {
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "restaurant channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: const DefaultStyleInformation(true, true));

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    late ListRestaurantResponseModel restaurantList;
    var result = await RestaurantRemoteDatasource().getListRestaurant();
    result.fold(
      (l) => (l),
      (r) {
        restaurantList = r;
        return;
      },
    );

    var restaurantItem = restaurantList.restaurants;

    var randomIndex = Random().nextInt(restaurantItem.length);
    var restaurantRandom = restaurantItem[randomIndex];

    var titleNotification = "<b>Headline Restaurant</b>";
    var titleRestaurant = restaurantRandom.name;

    await flutterLocalNotificationsPlugin.show(
      0,
      titleNotification,
      titleRestaurant,
      platformChannelSpecifics,
      payload: json.encode(restaurantRandom.toJson()),
    );
  }

  void configureSelectNotificationSubject(BuildContext context) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = Restaurant.fromJson(json.decode(payload));
      context.goNamed(Routes.detail, pathParameters: {'id': data.id});
    });
  }
}
