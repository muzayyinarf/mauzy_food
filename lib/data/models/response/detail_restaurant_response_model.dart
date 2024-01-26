import 'dart:convert';

import '../detail_restaurant.dart';

class DetailRestaurantResponseModel {
  final bool error;
  final String message;
  final DetailRestaurant restaurant;

  DetailRestaurantResponseModel({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory DetailRestaurantResponseModel.fromJson(String str) =>
      DetailRestaurantResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailRestaurantResponseModel.fromMap(Map<String, dynamic> json) =>
      DetailRestaurantResponseModel(
        error: json["error"],
        message: json["message"],
        restaurant: DetailRestaurant.fromMap(json["restaurant"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toMap(),
      };
}
