import 'dart:convert';

import 'category.dart';
import 'customer_review.dart';
import 'menus.dart';

class DetailRestaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final num rating;
  final List<CustomerReview> customerReviews;

  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory DetailRestaurant.fromJson(String str) =>
      DetailRestaurant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailRestaurant.fromMap(Map<String, dynamic> json) =>
      DetailRestaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
        menus: Menus.fromMap(json["menus"]),
        rating: json["rating"],
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "menus": menus.toMap(),
        "rating": rating,
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toMap())),
      };
}
