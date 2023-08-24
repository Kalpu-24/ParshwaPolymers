// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductLines {
  final String title;
  ProductLines({
    required this.title,
  });

  ProductLines copyWith({
    String? title,
  }) {
    return ProductLines(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  factory ProductLines.fromMap(Map<String, dynamic> map) {
    return ProductLines(
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductLines.fromJson(String source) =>
      ProductLines.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductLines(title: $title)';

  @override
  bool operator ==(dynamic other) =>
      other != null && other is ProductLines && title == other.title;

  @override
  int get hashCode => title.hashCode;
}
