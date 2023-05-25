// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class CompanyModel {
  static String className = 'Company';

  final String companyName;
  final String address;
  final String country;
  final double? lat;
  final double? lng;
  final String moneySymbol;
  CompanyModel({
    required this.companyName,
    required this.address,
    required this.country,
    required this.lat,
    required this.lng,
    required this.moneySymbol,
  });

  CompanyModel copyWith({
    String? companyName,
    String? address,
    String? country,
    double? lat,
    double? lng,
    String? moneySymbol,
  }) {
    return CompanyModel(
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      moneySymbol: moneySymbol ?? this.moneySymbol,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'address': address,
      'country': country,
      'lat': lat,
      'lng': lng,
      'moneySymbol': moneySymbol,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      companyName: map['companyName'] as String,
      address: map['address'] as String,
      country: map['country'] as String,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      moneySymbol: map['moneySymbol'] as String,
    );
  }

  factory CompanyModel.fromParse(ParseObject parse) {
    final ParseGeoPoint? point = parse.get('location');
    return CompanyModel(
      companyName: parse.get('company_name') as String,
      address: parse.get('address') as String,
      country: parse.get('country') as String,
      lat: point?.latitude,
      lng: point?.longitude,
      moneySymbol: parse.get('money_symbol') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyModel(companyName: $companyName, address: $address, country: $country, lat: $lat, lng: $lng, moneySymbol: $moneySymbol)';
  }

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;

    return other.companyName == companyName && other.address == address && other.country == country && other.lat == lat && other.lng == lng && other.moneySymbol == moneySymbol;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^ address.hashCode ^ country.hashCode ^ lat.hashCode ^ lng.hashCode ^ moneySymbol.hashCode;
  }
}
