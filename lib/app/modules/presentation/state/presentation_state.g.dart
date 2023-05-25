// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension PresentationStatusMatch on PresentationStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == PresentationStatus.initial) {
      return initial();
    }

    if (v == PresentationStatus.loading) {
      return loading();
    }

    if (v == PresentationStatus.loaded) {
      return loaded();
    }

    if (v == PresentationStatus.error) {
      return error();
    }

    throw Exception(
        'PresentationStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == PresentationStatus.initial && initial != null) {
      return initial();
    }

    if (v == PresentationStatus.loading && loading != null) {
      return loading();
    }

    if (v == PresentationStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == PresentationStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
