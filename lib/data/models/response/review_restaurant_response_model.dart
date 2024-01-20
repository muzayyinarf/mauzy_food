import 'dart:convert';

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

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(String str) =>
      CustomerReview.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerReview.fromMap(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "review": review,
        "date": date,
      };
}
