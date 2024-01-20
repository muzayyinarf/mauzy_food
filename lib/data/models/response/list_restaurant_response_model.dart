import 'dart:convert';

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

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(String str) =>
      Restaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
