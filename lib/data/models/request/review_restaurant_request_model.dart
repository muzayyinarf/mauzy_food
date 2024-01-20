import 'dart:convert';

class ReviewRestaurantRequestModel {
  final String id;
  final String name;
  final String review;

  ReviewRestaurantRequestModel({
    required this.id,
    required this.name,
    required this.review,
  });

  factory ReviewRestaurantRequestModel.fromJson(String str) =>
      ReviewRestaurantRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewRestaurantRequestModel.fromMap(Map<String, dynamic> json) =>
      ReviewRestaurantRequestModel(
        id: json["id"],
        name: json["name"],
        review: json["review"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "review": review,
      };
}
