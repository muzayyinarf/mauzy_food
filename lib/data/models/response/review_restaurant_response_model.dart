import 'dart:convert';

import '../customer_review.dart';

class ReviewRestaurantResponseModel {
  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  ReviewRestaurantResponseModel({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory ReviewRestaurantResponseModel.fromJson(String str) =>
      ReviewRestaurantResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReviewRestaurantResponseModel.fromMap(Map<String, dynamic> json) =>
      ReviewRestaurantResponseModel(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toMap())),
      };
}
