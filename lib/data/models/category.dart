import 'dart:convert';

class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
