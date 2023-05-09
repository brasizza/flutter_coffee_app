// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final BigInt id;
  final String title;
  final bool status;
  final int order;
  Category({
    required this.id,
    required this.title,
    required this.status,
    required this.order,
  });

  Category copyWith({
    BigInt? id,
    String? title,
    bool? status,
    int? order,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'status': status,
      'order': order,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: BigInt.from(map['id']),
      title: map['title'] as String,
      status: (map['status'] == 'on') ? true : false,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, title: $title, status: $status, order: $order)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.status == status && other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ status.hashCode ^ order.hashCode;
  }
}
