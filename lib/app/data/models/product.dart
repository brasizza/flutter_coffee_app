// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final BigInt id;
  final int order;
  final String title;
  final String description;
  final double price;
  final BigInt category;
  final bool status;
  final String? image;
  Product({
    required this.id,
    required this.order,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.status,
    required this.image,
  });

  Product copyWith({
    BigInt? id,
    int? order,
    String? title,
    String? description,
    double? price,
    BigInt? category,
    bool? status,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'status': status,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: BigInt.from(map['id']),
      order: map['order'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: double.tryParse(map['gross_price'].toString()) ?? 0.0,
      category: (map['category_id'] == null) ? BigInt.from(0) : BigInt.parse((map['category_id'].toString())),
      status: (map['status'] == 'on') ? true : false,
      image: (map['images'] is List)
          ? null
          : map['images']['m'] != null
              ? map['images']['m'] as String
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, order: $order, title: $title, description: $description, price: $price, category: $category, status: $status, image: $image)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id && other.order == order && other.title == title && other.description == description && other.price == price && other.category == category && other.status == status && other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ order.hashCode ^ title.hashCode ^ description.hashCode ^ price.hashCode ^ category.hashCode ^ status.hashCode ^ image.hashCode;
  }
}
