// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class Client {
  final String id;
  final String? name;
  final String password;
  final String email;
  final String? avatar;
  final String? phoneNumber;
  final double? lat;
  final double? lng;
  final bool verified;
  Client({
    required this.id,
    this.name,
    required this.password,
    required this.email,
    this.avatar,
    this.phoneNumber,
    this.lat,
    this.lng,
    required this.verified,
  });

  Client copyWith({
    String? id,
    String? name,
    String? password,
    String? email,
    String? avatar,
    String? phoneNumber,
    double? lat,
    double? lng,
    bool? verified,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      verified: verified ?? this.verified,
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
      'verified': verified,
    };
  }

  factory Client.fromFirebase(User user) {
    return Client(
      id: user.uid,
      name: user.displayName ?? '',
      password: '',
      email: user.email ?? '',
      avatar: user.photoURL ?? '',
      lat: null,
      lng: null,
      verified: user.emailVerified,
      phoneNumber: user.phoneNumber,
    );
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      lng: map['lng'] != null ? map['lng'] as double : null,
      verified: map['verified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Client(id: $id, name: $name, password: $password, email: $email, avatar: $avatar, phoneNumber: $phoneNumber, lat: $lat, lng: $lng, verified: $verified)';
  }

  @override
  bool operator ==(covariant Client other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.password == password && other.email == email && other.avatar == avatar && other.phoneNumber == phoneNumber && other.lat == lat && other.lng == lng && other.verified == verified;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ password.hashCode ^ email.hashCode ^ avatar.hashCode ^ phoneNumber.hashCode ^ lat.hashCode ^ lng.hashCode ^ verified.hashCode;
  }
}
