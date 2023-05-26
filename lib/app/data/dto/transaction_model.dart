// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:howabout_coffee/app/data/models/product_model_checkout.dart';

class TransactionModel {
  final String transactionId;
  final int totalItems;
  final double totalTransaction;
  final List<ProductModelCheckout> products;
  TransactionModel({
    required this.transactionId,
    required this.totalItems,
    required this.totalTransaction,
    required this.products,
  });

  TransactionModel copyWith({
    String? transactionId,
    int? totalItems,
    double? totalTransaction,
    List<ProductModelCheckout>? products,
  }) {
    return TransactionModel(
      transactionId: transactionId ?? this.transactionId,
      totalItems: totalItems ?? this.totalItems,
      totalTransaction: totalTransaction ?? this.totalTransaction,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'totalItems': totalItems,
      'totalTransaction': totalTransaction,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['transactionId'] as String,
      totalItems: map['totalItems'] as int,
      totalTransaction: map['totalTransaction'] as double,
      products: List<ProductModelCheckout>.from(
        (map['products'] as List).map<ProductModelCheckout>(
          (x) => ProductModelCheckout.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(transactionId: $transactionId, totalItems: $totalItems, totalTransaction: $totalTransaction, products: $products)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.transactionId == transactionId && other.totalItems == totalItems && other.totalTransaction == totalTransaction && listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return transactionId.hashCode ^ totalItems.hashCode ^ totalTransaction.hashCode ^ products.hashCode;
  }
}
