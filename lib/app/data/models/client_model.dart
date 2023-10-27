// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// import 'package:firebase_auth/firebase_auth.dart';

class ClientModel {
  final String? id;
  final String? name;
  final String password;
  final String email;
  final String? avatar;
  final String? phoneNumber;
  final double? lat;
  final double? lng;
  final double? totalCredit;
  final bool? anonymous;
  ClientModel({
    required this.id,
    this.name,
    required this.password,
    required this.email,
    this.avatar,
    this.phoneNumber,
    this.lat,
    this.lng,
    this.totalCredit,
    this.anonymous = false
  });

  ClientModel copyWith({
    String? id,
    String? name,
    String? password,
    String? email,
    String? avatar,
    String? phoneNumber,
    double? lat,
    double? lng,
    double? totalCredit,
    bool? anonymous,
  }) {
    return ClientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      totalCredit: totalCredit ?? this.totalCredit,
      anonymous: anonymous ?? this.anonymous,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'avatar': avatar,
      'phoneNumber': phoneNumber,
      'lat': lat,
      'lng': lng,
      'totalCredit': totalCredit,
      'anonymous': anonymous,
    };
  }

  factory ClientModel.fromParse(ParseObject user) {
    return ClientModel(
      id: user.objectId,
      // idFirebase: user.uid,
      // name: user.displayName ?? '',
      password: '',
      email: user.get('email'),
      // avatar: null,
      lat: null,
      lng: null,
      // phoneNumber: null,
    );
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      lng: map['lng'] != null ? map['lng'] as double : null,
      totalCredit: map['totalCredit'] != null ? map['totalCredit'] as double : null,
      anonymous: map['anonymous'] != null ? map['anonymous'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;
  
    return other.id == id && other.name == name && other.password == password && other.email == email && other.avatar == avatar && other.phoneNumber == phoneNumber && other.lat == lat && other.lng == lng && other.totalCredit == totalCredit && other.anonymous == anonymous;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ password.hashCode ^ email.hashCode ^ avatar.hashCode ^ phoneNumber.hashCode ^ lat.hashCode ^ lng.hashCode ^ totalCredit.hashCode ^ anonymous.hashCode;
  }

  @override
  String toString() {
    return 'ClientModel(id: $id, name: $name, password: $password, email: $email, avatar: $avatar, phoneNumber: $phoneNumber, lat: $lat, lng: $lng, totalCredit: $totalCredit, anonymous: $anonymous)';
  }
}
