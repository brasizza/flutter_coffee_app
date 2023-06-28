import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/notification_model.dart';
import 'package:howabout_coffee/app/data/repositories/notification/notification_repository.dart';

import './notification_service.dart';

class NotificationServiceImpl implements NotificationService {
  final NotificationRepository _repository;
  NotificationServiceImpl({
    required NotificationRepository repository,
  }) : _repository = repository;
  @override
  Stream<NotificationModel> init({required ClientModel client}) {
    return _repository.init(client: client);
  }
}
