import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:mauzy_food/data/models/response/list_restaurant_response_model.dart';
import 'package:mauzy_food/main.dart';

import '../data/datasources/restaurant_remote_datasource.dart';
import 'notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    debugPrint('Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await RestaurantRemoteDatasource().getListRestaurant();

    late ListRestaurantResponseModel restaurant;
    result.fold(
      (l) => null,
      (r) => restaurant = r,
    );
    await notificationHelper.showNotification(
      flutterLocalNotificationsPlugin,
      restaurant,
    );

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  Future<void> someTask() async {
    debugPrint('Updated data from the background isolate');
  }
}
