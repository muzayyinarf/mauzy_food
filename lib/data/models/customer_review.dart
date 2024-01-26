import 'dart:convert';

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
