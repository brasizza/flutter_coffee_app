// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:howabout_coffee/app/data/models/product_model.dart';

class ProductModelCheckout extends ProductModel {
  final int quantity;

  ProductModelCheckout({
    required super.id,
    required super.order,
    required super.titlePT,
    required super.titleEN,
    required super.titleES,
    required super.descriptionPT,
    required super.descriptionEN,
    required super.descriptionES,
    required super.price,
    required super.category,
    required super.status,
    required super.image,
    super.imageBig,
    this.quantity = 0,
  });

  @override
  ProductModelCheckout copyWith({
    BigInt? id,
    int? order,
    String? titlePT,
    String? titleEN,
    String? titleES,
    String? descriptionPT,
    String? descriptionEN,
    String? descriptionES,
    double? price,
    BigInt? category,
    bool? status,
    String? image,
    String? imageBig,
    int? quantity,
  }) {
    return ProductModelCheckout(
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
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'order': order, 'titlePT': titlePT, 'titleEN': titleEN, 'titleES': titleES, 'descriptionPT': descriptionPT, 'descriptionEN': descriptionEN, 'descriptionES': descriptionES, 'price': price, 'category': category, 'status': status, 'image': image, 'imageBig': imageBig, 'quantity': quantity};
  }

  factory ProductModelCheckout.fromMap(Map<String, dynamic> map) {
    return ProductModelCheckout(
      quantity: map['quantity'] ?? 0,
      id: BigInt.parse(map['id'].toString()),
      order: map['order'] as int,
      titlePT: map['titlePT'] as String,
      titleEN: map['titleEN'] as String,
      titleES: map['titleES'] as String,
      descriptionPT: map['descriptionPT'] as String,
      descriptionEN: map['descriptionEN'] as String,
      descriptionES: map['descriptionES'] as String,
      price: map['price'] as double,
      category: BigInt.parse(map['category'].toString()),
      status: map['status'] as bool,
      image: map['image'] != null ? map['image'] as String : null,
      imageBig: map['imageBig'] != null ? map['imageBig'] as String : null,
    );
  }

  @override
  String toString() {
    return 'ProductModelCheckout(id: $id, order: $order, titlePT: $titlePT, titleEN: $titleEN, titleES: $titleES, descriptionPT: $descriptionPT, descriptionEN: $descriptionEN, descriptionES: $descriptionES, price: $price, category: $category, status: $status, image: $image, imageBig: $imageBig)';
  }

  @override
  bool operator ==(covariant ProductModelCheckout other) {
    if (identical(this, other)) return true;

    return other.id == id && other.order == order && other.titlePT == titlePT && other.titleEN == titleEN && other.titleES == titleES && other.descriptionPT == descriptionPT && other.descriptionEN == descriptionEN && other.descriptionES == descriptionES && other.price == price && other.category == category && other.status == status && other.image == image && other.imageBig == imageBig;
  }

  @override
  int get hashCode {
    return id.hashCode ^ order.hashCode ^ titlePT.hashCode ^ titleEN.hashCode ^ titleES.hashCode ^ descriptionPT.hashCode ^ descriptionEN.hashCode ^ descriptionES.hashCode ^ price.hashCode ^ category.hashCode ^ status.hashCode ^ image.hashCode ^ imageBig.hashCode;
  }
}
