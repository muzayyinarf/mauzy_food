import 'dart:convert';

import '../restaurant.dart';

class ListRestaurantResponseModel {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  ListRestaurantResponseModel({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory ListRestaurantResponseModel.fromJson(String str) =>
      ListRestaurantResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListRestaurantResponseModel.fromMap(Map<String, dynamic> json) =>
      ListRestaurantResponseModel(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toMap())),
      };
}
