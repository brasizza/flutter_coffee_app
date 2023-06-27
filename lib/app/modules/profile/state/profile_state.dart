// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/data/models/client_model.dart';
import 'package:match/match.dart';

part 'profile_state.g.dart';

@match
enum ProfileStatus { initial, loading, loaded, error, clientLoaded, photoChanged, clientUpdated }

class ProfileState extends Equatable {
  final ClientModel? client;
  final Image? photoProfile;
  final ProfileStatus status;
  final String? errorMessage;
  const ProfileState({required this.status, this.errorMessage = '', this.client, this.photoProfile});
  @override
  List get props => [
        status,
        errorMessage,
        client,
        photoProfile,
      ];
  const ProfileState.initial()
      : status = ProfileStatus.initial,
        client = null,
        photoProfile = null,
        errorMessage = '';

  ProfileState copyWith({
    ProfileStatus? status,
    ClientModel? client,
    String? errorMessage,
    Image? photoProfile,
  }) {
    return ProfileState(
      status: status ?? this.status,
      client: client ?? this.client,
      photoProfile: photoProfile ?? this.photoProfile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
