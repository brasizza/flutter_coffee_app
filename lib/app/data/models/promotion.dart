// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Promotion {
  final String image;
  Promotion({
    required this.image,
  });

  Promotion copyWith({
    String? image,
  }) {
    return Promotion(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Promotion.fromJson(String source) => Promotion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Promotion(image: $image)';

  @override
  bool operator ==(covariant Promotion other) {
    if (identical(this, other)) return true;

    return other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}
