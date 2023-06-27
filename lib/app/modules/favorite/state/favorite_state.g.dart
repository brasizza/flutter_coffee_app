// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension FavoriteStatusMatch on FavoriteStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == FavoriteStatus.initial) {
      return initial();
    }

    if (v == FavoriteStatus.loading) {
      return loading();
    }

    if (v == FavoriteStatus.loaded) {
      return loaded();
    }

    if (v == FavoriteStatus.error) {
      return error();
    }

    throw Exception('FavoriteStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == FavoriteStatus.initial && initial != null) {
      return initial();
    }

    if (v == FavoriteStatus.loading && loading != null) {
      return loading();
    }

    if (v == FavoriteStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == FavoriteStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
