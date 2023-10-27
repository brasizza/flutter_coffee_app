// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/core/notification/state/notification_state.dart';
import 'package:howabout_coffee/app/data/models/notification_model.dart';
import 'package:howabout_coffee/app/data/services/notification/notification_service.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';

class NotificationController extends Cubit<NotificationState> {
  final NotificationService _service;
  final UserService _userService;
  NotificationController({
    required NotificationService service,
    required UserService userService,
  })  : _service = service,
        _userService = userService,
        super(const NotificationState.initial());

  void init() async {
    final user = _userService.currentUser;
    if (user != null && user.anonymous == false) {
      _service.init(client: user).listen((notificationModel) async {
        List<NotificationModel> notifications = List.from(state.notifications);
        final indexOf = notifications.indexWhere((notification) => notification.id == notificationModel.id);
        if (indexOf < 0) {
          if (notificationModel.type != 'delete') {
            notifications.add(notificationModel);
          }
        } else {
          if (notificationModel.type == 'delete') {
            notifications.removeAt(indexOf);
          } else {
            notifications[indexOf] = notificationModel;
          }
        }
        emit(state.copyWith(status: NotificationStatus.newNotification, notifications: notifications));
      });
    }
  }
}
