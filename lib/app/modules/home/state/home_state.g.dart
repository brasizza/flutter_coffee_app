// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension HomeStatusMatch on HomeStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() clientLoaded}) {
    final v = this;
    if (v == HomeStatus.initial) {
      return initial();
    }

    if (v == HomeStatus.loading) {
      return loading();
    }

    if (v == HomeStatus.loaded) {
      return loaded();
    }

    if (v == HomeStatus.error) {
      return error();
    }

    if (v == HomeStatus.clientLoaded) {
      return clientLoaded();
    }

    throw Exception('HomeStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? clientLoaded}) {
    final v = this;
    if (v == HomeStatus.initial && initial != null) {
      return initial();
    }

    if (v == HomeStatus.loading && loading != null) {
      return loading();
    }

    if (v == HomeStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == HomeStatus.error && error != null) {
      return error();
    }

    if (v == HomeStatus.clientLoaded && clientLoaded != null) {
      return clientLoaded();
    }

    return any();
  }
}
