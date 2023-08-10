// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:howabout_coffee/app/data/models/product_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ProductModelCheckout extends ProductModel {
  final int quantity;

  ProductModelCheckout({required super.id, required super.order, required super.titlePT, required super.titleEN, required super.titleES, required super.descriptionPT, required super.descriptionEN, required super.descriptionES, required super.price, required super.category, required super.status, required super.image, super.favorite, super.imageBig, this.quantity = 0, required super.directSale, required super.objectId});

  @override
  ProductModelCheckout copyWith({
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
    String? objectId,
    int? quantity,
    bool? favorite,
    bool? directSale,
  }) {
    return ProductModelCheckout(
      objectId: objectId ?? this.objectId,
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
      quantity: quantity ?? this.quantity,
      favorite: favorite ?? this.favorite,
      directSale: directSale ?? this.directSale,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'order': order, 'titlePT': titlePT, 'titleEN': titleEN, 'titleES': titleES, 'descriptionPT': descriptionPT, 'descriptionEN': descriptionEN, 'descriptionES': descriptionES, 'price': price, 'category': category, 'status': status, 'image': image, 'imageBig': imageBig, 'quantity': quantity};
  }

  factory ProductModelCheckout.fromMap(Map<String, dynamic> map) {
    return ProductModelCheckout(
      quantity: map['quantity'] ?? 0,
      id: int.parse(map['id'].toString()),
      objectId: map['objectId'] as String,
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
      directSale: (map['directSale'] == null) ? false : map['directSale'],
      image: map['image'] != null ? map['image'] as String : null,
      imageBig: map['imageBig'] != null ? map['imageBig'] as String : null,
    );
  }

  factory ProductModelCheckout.fromParse(ParseObject parse) {
    return ProductModelCheckout(
      objectId: parse.objectId ?? '',
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
      directSale: parse.get('status') == null ? false : parse.get('status') as bool,
      image: parse.get('image_thumb')?.get('url'),
      imageBig: parse.get('image_description')?.get('url'),
    );
  }

  @override
  String toString() {
    return 'ProductModelCheckout(id: $id, order: $order, titlePT: $titlePT, titleEN: $titleEN, titleES: $titleES, descriptionPT: $descriptionPT, descriptionEN: $descriptionEN, descriptionES: $descriptionES, price: $price, category: $category, status: $status, image: $image, imageBig: $imageBig)';
  }

  @override
  bool operator ==(covariant ProductModelCheckout other) {
    if (identical(this, other)) return true;

    return other.id == id && other.quantity == quantity && other.order == order && other.titlePT == titlePT && other.titleEN == titleEN && other.titleES == titleES && other.descriptionPT == descriptionPT && other.descriptionEN == descriptionEN && other.descriptionES == descriptionES && other.price == price && other.category == category && other.status == status && other.image == image && other.imageBig == imageBig;
  }

  @override
  int get hashCode {
    return id.hashCode ^ order.hashCode ^ quantity.hashCode ^ titlePT.hashCode ^ titleEN.hashCode ^ titleES.hashCode ^ descriptionPT.hashCode ^ descriptionEN.hashCode ^ descriptionES.hashCode ^ price.hashCode ^ category.hashCode ^ status.hashCode ^ image.hashCode ^ imageBig.hashCode;
  }
}
