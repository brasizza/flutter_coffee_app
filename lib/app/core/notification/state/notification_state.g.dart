// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension NotificationStatusMatch on NotificationStatus {
  T match<T>(
      {required T Function() initial, required T Function() newNotification}) {
    final v = this;
    if (v == NotificationStatus.initial) {
      return initial();
    }

    if (v == NotificationStatus.newNotification) {
      return newNotification();
    }

    throw Exception(
        'NotificationStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? newNotification}) {
    final v = this;
    if (v == NotificationStatus.initial && initial != null) {
      return initial();
    }

    if (v == NotificationStatus.newNotification && newNotification != null) {
      return newNotification();
    }

    return any();
  }
}
