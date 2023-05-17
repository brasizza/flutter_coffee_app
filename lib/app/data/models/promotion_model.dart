// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PromotionModel {
  final String image;
  PromotionModel({
    required this.image,
  });

  PromotionModel copyWith({
    String? image,
  }) {
    return PromotionModel(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionModel.fromJson(String source) => PromotionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PromotionModel(image: $image)';

  @override
  bool operator ==(covariant PromotionModel other) {
    if (identical(this, other)) return true;

    return other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}
