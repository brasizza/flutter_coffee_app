import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepository {
  Future<bool> save(ClientModel client);
  Future<ClientModel?> getUser();
  Future<ClientModel> updateUser({required ClientModel client, XFile? profilePicture});

  Future<List<int>?> getFavoriteUser(ClientModel? user);

  Future<List<int>> manageFavorites(ClientModel client, int productId);
}
