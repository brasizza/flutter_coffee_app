import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:howabout_coffee/app/modules/profile/state/profile_state.dart';

class ProfileController extends Cubit<ProfileState> {
  ProfileController() : super(const ProfileState.initial());

  addUser(ClientModel? client) {
    if (client != null) {
      emit(state.copyWith(client: client, status: ProfileStatus.clientLoaded));
    }
  }
}
