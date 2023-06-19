import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/data/services/user/user_service.dart';
import 'package:howabout_coffee/app/modules/profile/state/profile_state.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends Cubit<ProfileState> {
  final UserService _service;
  ProfileController({required UserService service})
      : _service = service,
        super(const ProfileState.initial());

  addUser(ClientModel? client) {
    if (client != null) {
      emit(state.copyWith(client: client, status: ProfileStatus.clientLoaded));
    }
  }

  Future<bool> takePhoto({required String source}) async {
    late File image;
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(preferredCameraDevice: CameraDevice.front, source: (source == 'camera') ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      // await _updateProfilePicture(image);
      emit(state.copyWith(status: ProfileStatus.photoChanged, photoProfile: image));
      return true;
    }

    return false;
  }

  Future<ClientModel?> changeProfile({required ClientModel client, File? profilePicture}) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final clientUpdated = await _service.updateUser(client: client, profilePicture: profilePicture);
      emit(state.copyWith(status: ProfileStatus.loaded));
      return clientUpdated;
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()));
    }

    return null;
  }
}
