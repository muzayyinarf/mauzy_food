import 'dart:convert';

import 'category.dart';

class Menus {
  final List<Category> foods;
  final List<Category> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(String str) => Menus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Menus.fromMap(Map<String, dynamic> json) => Menus(
        foods:
            List<Category>.from(json["foods"].map((x) => Category.fromMap(x))),
        drinks:
            List<Category>.from(json["drinks"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toMap())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toMap())),
      };
}
