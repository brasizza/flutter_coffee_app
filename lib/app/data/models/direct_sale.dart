// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class DirectSale {
  static String className = 'DirectSale';
  final String? objectId;
  final ClientModel? user;
  final ProductModelCheckout? product;
  final bool? used;
  DirectSale({
    this.objectId,
    this.user,
    this.product,
    this.used,
  });

  DirectSale copyWith({
    String? objectId,
    ClientModel? user,
    ProductModelCheckout? product,
    bool? used,
  }) {
    return DirectSale(
      objectId: objectId ?? this.objectId,
      user: user ?? this.user,
      product: product ?? this.product,
      used: used ?? this.used,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'user': user?.toMap(),
      'product': product?.toMap(),
      'used': used,
    };
  }

  factory DirectSale.fromMap(Map<String, dynamic> map) {
    return DirectSale(
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
      user: map['user'] != null ? ClientModel.fromMap(map['user'] as Map<String, dynamic>) : null,
      product: map['product'] != null ? ProductModelCheckout.fromMap(map['product'] as Map<String, dynamic>) : null,
      used: map['used'] != null ? map['used'] as bool : null,
    );
  }

  static ParseObject toParse(DirectSale model) {
    final object = ParseObject('DirectSale');
    object.set('user', ParseObject('_User')..objectId = model.user?.id);
    object.set('product', ParseObject('Product')..objectId = model.product?.objectId);
    object.set('used', model.used);
    return object;
  }

  factory DirectSale.fromParse(ParseObject parse) {
    log((parse.get('product') as ParseObject).toJson().toString());
    return DirectSale(
      objectId: parse.objectId ?? '',
      //product: parse.getObject(objectId)
    );
  }

  String toJson() => json.encode(toMap());

  factory DirectSale.fromJson(String source) => DirectSale.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DirectSale(objectId: $objectId, user: $user, product: $product, used: $used)';
  }

  @override
  bool operator ==(covariant DirectSale other) {
    if (identical(this, other)) return true;

    return other.objectId == objectId && other.user == user && other.product == product && other.used == used;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^ user.hashCode ^ product.hashCode ^ used.hashCode;
  }
}
