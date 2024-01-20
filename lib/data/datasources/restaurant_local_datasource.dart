import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/restaurant.dart';

class RestaurantLocalDatasource {
  Future<Restaurant> getRestaurants() async {
    String data =
        await rootBundle.loadString('assets/json/local_restaurant.json');

    Restaurant restaurant = Restaurant.fromMap(json.decode(data));

    return restaurant;
  }

  Future<RestaurantElement?> getRestaurantById(String id) async {
    Restaurant restaurant = await getRestaurants();

    List<RestaurantElement> restaurants = restaurant.restaurants;
    RestaurantElement? foundRestaurant;

    for (var element in restaurants) {
      if (element.id == id) {
        foundRestaurant = element;
        break;
      }
    }

    return foundRestaurant;
  }
}
