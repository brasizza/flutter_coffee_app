// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CategoryModel {
  static String className = 'Category';

  final BigInt id;
  final String titlePT;
  final String titleES;
  final String titleEN;
  final bool status;
  final int order;
  CategoryModel({
    required this.id,
    required this.titlePT,
    required this.titleES,
    required this.titleEN,
    required this.status,
    required this.order,
  });

  CategoryModel copyWith({
    BigInt? id,
    String? titlePT,
    String? titleES,
    String? titleEN,
    bool? status,
    int? order,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      titlePT: titlePT ?? this.titlePT,
      titleES: titleES ?? this.titleES,
      titleEN: titleEN ?? this.titleEN,
      status: status ?? this.status,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titlePT': titlePT,
      'titleES': titleES,
      'titleEN': titleEN,
      'status': status,
      'order': order,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: BigInt.from(map['id'] as num),
      titlePT: map['titlePT'] as String,
      titleES: map['titleES'] as String,
      titleEN: map['titleEN'] as String,
      status: map['status'] as bool,
      order: map['order'] as int,
    );
  }

  factory CategoryModel.fromParse(ParseObject object) {
    return CategoryModel(
      id: BigInt.from(object.get('category_id') as num),
      titlePT: object.get('title_pt') as String,
      titleEN: object.get('title_en') as String,
      titleES: object.get('title_es') as String,
      status: object.get<bool>('status') ?? true,
      order: object.get('order') as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, titlePT: $titlePT, titleES: $titleES, titleEN: $titleEN, status: $status, order: $order)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.titlePT == titlePT && other.titleES == titleES && other.titleEN == titleEN && other.status == status && other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^ titlePT.hashCode ^ titleES.hashCode ^ titleEN.hashCode ^ status.hashCode ^ order.hashCode;
  }
}
