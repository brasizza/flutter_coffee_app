// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProductModel {
  static String className = 'Product';

  final int id;
  final int order;
  final String titlePT;
  final String titleEN;
  final String titleES;

  final String descriptionPT;
  final String descriptionEN;
  final String descriptionES;
  final double price;
  final int category;
  final bool status;
  final String? image;
  final String? imageBig;
  final bool? favorite;
  ProductModel({required this.id, required this.order, required this.titlePT, required this.titleEN, required this.titleES, required this.descriptionPT, required this.descriptionEN, required this.descriptionES, required this.price, required this.category, required this.status, required this.image, this.imageBig, this.favorite = false});

  ProductModel copyWith({
    int? id,
    int? order,
    String? titlePT,
    String? titleEN,
    String? titleES,
    String? descriptionPT,
    String? descriptionEN,
    String? descriptionES,
    double? price,
    int? category,
    bool? status,
    String? image,
    String? imageBig,
    bool? favorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      order: order ?? this.order,
      titlePT: titlePT ?? this.titlePT,
      titleEN: titleEN ?? this.titleEN,
      titleES: titleES ?? this.titleES,
      descriptionPT: descriptionPT ?? this.descriptionPT,
      descriptionEN: descriptionEN ?? this.descriptionEN,
      descriptionES: descriptionES ?? this.descriptionES,
      price: price ?? this.price,
      category: category ?? this.category,
      status: status ?? this.status,
      image: image ?? this.image,
      imageBig: imageBig ?? this.imageBig,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'titlePT': titlePT,
      'titleEN': titleEN,
      'titleES': titleES,
      'descriptionPT': descriptionPT,
      'descriptionEN': descriptionEN,
      'descriptionES': descriptionES,
      'price': price,
      'category': category,
      'status': status,
      'image': image,
      'imageBig': imageBig,
      'favorite': favorite,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: int.parse(map['id'].toString()),
      order: map['order'] as int,
      titlePT: map['titlePT'] as String,
      titleEN: map['titleEN'] as String,
      titleES: map['titleES'] as String,
      descriptionPT: map['descriptionPT'] as String,
      descriptionEN: map['descriptionEN'] as String,
      descriptionES: map['descriptionES'] as String,
      price: map['price'] as double,
      category: int.parse(map['category'].toString()),
      status: map['status'] as bool,
      image: map['image'] != null ? map['image'] as String : null,
      imageBig: map['imageBig'] != null ? map['imageBig'] as String : null,
      favorite: map['favorite'],
    );
  }

  factory ProductModel.fromParse(ParseObject parse) {
    return ProductModel(
      id: (parse.get('product_id') as int),
      order: parse.get('order') as int,
      titlePT: parse.get('title_pt') as String,
      titleEN: parse.get('title_en') as String,
      titleES: parse.get('title_es') as String,
      descriptionEN: parse.get('description_en') as String,
      descriptionES: parse.get('description_es') as String,
      descriptionPT: parse.get('description_pt') as String,
      price: double.tryParse(parse.get('price').toString()) ?? 0.0,
      category: (parse.get('category_id') == null) ? 0 : int.parse((parse.get('category_id').toString())),
      status: parse.get('status') as bool,
      image: parse.get('image_thumb')?.get('url'),
      imageBig: parse.get('image_description')?.get('url'),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, order: $order, titlePT: $titlePT, titleEN: $titleEN, titleES: $titleES, descriptionPT: $descriptionPT, descriptionEN: $descriptionEN, descriptionES: $descriptionES, price: $price, category: $category, status: $status, image: $image, imageBig: $imageBig)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.order == order && other.titlePT == titlePT && other.titleEN == titleEN && other.titleES == titleES && other.descriptionPT == descriptionPT && other.descriptionEN == descriptionEN && other.descriptionES == descriptionES && other.price == price && other.category == category && other.status == status && other.image == image && other.imageBig == imageBig;
  }

  @override
  int get hashCode {
    return id.hashCode ^ order.hashCode ^ titlePT.hashCode ^ titleEN.hashCode ^ titleES.hashCode ^ descriptionPT.hashCode ^ descriptionEN.hashCode ^ descriptionES.hashCode ^ price.hashCode ^ category.hashCode ^ status.hashCode ^ image.hashCode ^ imageBig.hashCode;
  }
}
