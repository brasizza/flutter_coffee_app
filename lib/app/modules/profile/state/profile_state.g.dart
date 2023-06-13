// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ProfileStatusMatch on ProfileStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() clientLoaded}) {
    final v = this;
    if (v == ProfileStatus.initial) {
      return initial();
    }

    if (v == ProfileStatus.loading) {
      return loading();
    }

    if (v == ProfileStatus.loaded) {
      return loaded();
    }

    if (v == ProfileStatus.error) {
      return error();
    }

    if (v == ProfileStatus.clientLoaded) {
      return clientLoaded();
    }

    throw Exception('ProfileStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? clientLoaded}) {
    final v = this;
    if (v == ProfileStatus.initial && initial != null) {
      return initial();
    }

    if (v == ProfileStatus.loading && loading != null) {
      return loading();
    }

    if (v == ProfileStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == ProfileStatus.error && error != null) {
      return error();
    }

    if (v == ProfileStatus.clientLoaded && clientLoaded != null) {
      return clientLoaded();
    }

    return any();
  }
}
