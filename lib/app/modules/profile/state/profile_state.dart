// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:match/match.dart';

part 'profile_state.g.dart';

@match
enum ProfileStatus { initial, loading, loaded, error, clientLoaded }

class ProfileState extends Equatable {
  final ClientModel? client;
  final ProfileStatus status;
  final String? errorMessage;
  const ProfileState({required this.status, this.errorMessage = '', this.client});
  @override
  List get props => [status, errorMessage, client];
  const ProfileState.initial()
      : status = ProfileStatus.initial,
        client = null,
        errorMessage = '';

  ProfileState copyWith({
    ProfileStatus? status,
    ClientModel? client,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      client: client ?? this.client,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
