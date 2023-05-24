// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompanyModel {
  static String className = 'Company';

  final String companyName;
  final String address;
  final String country;
  final String location;
  final String moneySymbol;
  CompanyModel({
    required this.companyName,
    required this.address,
    required this.country,
    required this.location,
    required this.moneySymbol,
  });

  CompanyModel copyWith({
    String? companyName,
    String? address,
    String? country,
    String? location,
    String? moneySymbol,
  }) {
    return CompanyModel(
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      country: country ?? this.country,
      location: location ?? this.location,
      moneySymbol: moneySymbol ?? this.moneySymbol,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'company_name': companyName,
      'address': address,
      'country': country,
      'location': location,
      'money_symbol': moneySymbol,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      companyName: map['company_name'] as String,
      address: map['address'] as String,
      country: map['country'] as String,
      location: map['location'] as String,
      moneySymbol: map['money_symbol'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyModel(companyName: $companyName, address: $address, country: $country, location: $location, moneySymbol: $moneySymbol)';
  }

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;

    return other.companyName == companyName && other.address == address && other.country == country && other.location == location && other.moneySymbol == moneySymbol;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^ address.hashCode ^ country.hashCode ^ location.hashCode ^ moneySymbol.hashCode;
  }
}
