// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class NotificationModel {
  final String type;
  final String? id;
  final String title;
  final String message;
  final bool read;
  NotificationModel({
    this.type = 'normal',
    required this.id,
    required this.title,
    required this.message,
    required this.read,
  });

  NotificationModel copyWith({
    String? type,
    String? id,
    String? title,
    String? message,
    bool? read,
  }) {
    return NotificationModel(
      type: type ?? this.type,
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      read: read ?? this.read,
    );
  }

  factory NotificationModel.fromParse(ParseObject notification, [String type = 'normal']) {
    return NotificationModel(
      type: type,
      id: notification.objectId,
      title: notification.get('title'),
      message: notification.get('message'),
      read: notification.get<bool>('read') ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'title': title,
      'message': message,
      'read': read,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      type: map['type'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      message: map['message'] as String,
      read: map['read'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) => NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(type: $type, id: $id, title: $title, message: $message, read: $read)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;

    return other.type == type && other.id == id && other.title == title && other.message == message && other.read == read;
  }

  @override
  int get hashCode {
    return type.hashCode ^ id.hashCode ^ title.hashCode ^ message.hashCode ^ read.hashCode;
  }
}
