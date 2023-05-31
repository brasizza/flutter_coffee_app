// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension LocationStatusMatch on LocationStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() locationChanged}) {
    final v = this;
    if (v == LocationStatus.initial) {
      return initial();
    }

    if (v == LocationStatus.loading) {
      return loading();
    }

    if (v == LocationStatus.loaded) {
      return loaded();
    }

    if (v == LocationStatus.error) {
      return error();
    }

    if (v == LocationStatus.locationChanged) {
      return locationChanged();
    }

    throw Exception('LocationStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? locationChanged}) {
    final v = this;
    if (v == LocationStatus.initial && initial != null) {
      return initial();
    }

    if (v == LocationStatus.loading && loading != null) {
      return loading();
    }

    if (v == LocationStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == LocationStatus.error && error != null) {
      return error();
    }

    if (v == LocationStatus.locationChanged && locationChanged != null) {
      return locationChanged();
    }

    return any();
  }
}
