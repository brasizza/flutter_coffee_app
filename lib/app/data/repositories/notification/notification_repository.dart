import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/models/notification_model.dart';

abstract class NotificationRepository {
  Stream<NotificationModel> init({required ClientModel client});
}
