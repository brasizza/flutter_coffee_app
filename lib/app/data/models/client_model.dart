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
  ClientModel({
    required this.id,
    this.name,
    required this.password,
    required this.email,
    this.avatar,
    this.phoneNumber,
    this.lat,
    this.lng,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'avatar': avatar,
      'phone_number': phoneNumber,
      'lat': lat,
      'lng': lng,
    };
  }

  factory ClientModel.fromParse(ParseObject user) {
    return ClientModel(
      id: user.objectId,
      // idFirebase: user.uid,
      // name: user.displayName ?? '',
      password: '',
      email: user.get('email'),
      avatar: null,
      lat: null,
      lng: null,
      phoneNumber: null,
    );
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'],
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] != null ? map['password'] as String : '',
      email: map['email'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      phoneNumber: map['phone_number'] != null ? map['phone_number'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double? : null,
      lng: map['lng'] != null ? map['lng'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.password == password && other.email == email && other.avatar == avatar && other.phoneNumber == phoneNumber && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ password.hashCode ^ email.hashCode ^ avatar.hashCode ^ phoneNumber.hashCode ^ lat.hashCode ^ lng.hashCode;
  }

  @override
  String toString() {
    return 'ClientModel(id: $id,  name: $name, password: $password, email: $email, avatar: $avatar, phoneNumber: $phoneNumber, lat: $lat, lng: $lng)';
  }
}
