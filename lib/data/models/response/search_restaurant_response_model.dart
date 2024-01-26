import 'dart:convert';

import '../restaurant.dart';

class SearchRestaurantResponseModel {
  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  SearchRestaurantResponseModel({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory SearchRestaurantResponseModel.fromJson(String str) =>
      SearchRestaurantResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchRestaurantResponseModel.fromMap(Map<String, dynamic> json) =>
      SearchRestaurantResponseModel(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toMap())),
      };
}
