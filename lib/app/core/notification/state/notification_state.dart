// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/notification_model.dart';
import 'package:match/match.dart';

part 'notification_state.g.dart';

@match
enum NotificationStatus { initial, newNotification }

class NotificationState extends Equatable {
  final List<NotificationModel> notifications;
  final NotificationStatus status;

  const NotificationState({required this.status, required this.notifications});
  @override
  List<Object> get props => [notifications, status];

  const NotificationState.initial()
      : status = NotificationStatus.initial,
        notifications = const [];

  NotificationState copyWith({
    List<NotificationModel>? notifications,
    NotificationStatus? status,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      status: status ?? this.status,
    );
  }
}
