// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final String id;
  final String name;
  final String title;
  final String material;
  final Map<String, dynamic> image;
  Product({
    required this.id,
    required this.name,
    required this.title,
    required this.material,
    required this.image,
  });

  Product copyWith({
    String? id,
    String? name,
    String? title,
    String? material,
    Map<String, dynamic>? image,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      material: material ?? this.material,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'title': title,
      'material': material,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'] as String,
        name: map['name'] as String,
        title: map['title'] as String,
        material: map['material'] as String,
        image: Map<String, dynamic>.from(
          (map['image'] as Map<String, dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, title: $title, material: $material, image: $image)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.title == title &&
        other.material == material &&
        mapEquals(other.image, image);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        title.hashCode ^
        material.hashCode ^
        image.hashCode;
  }
}
