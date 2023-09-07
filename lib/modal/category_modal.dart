// To parse this JSON data, do
//
//     final categorymodal = categorymodalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Categorymodal categorymodalFromJson(String str) => Categorymodal.fromJson(json.decode(str));



class Categorymodal {
  List<Category> categories;

  Categorymodal({
    required this.categories,
  });

  factory Categorymodal.fromJson(Map<String, dynamic> json) => Categorymodal(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );


}

class Category {
  String name;
  List<String> subcategory;

  Category({
    required this.name,
    required this.subcategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    subcategory: List<String>.from(json["subcategory"].map((x) => x)),
  );


}
