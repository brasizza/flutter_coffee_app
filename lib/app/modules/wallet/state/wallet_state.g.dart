// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension WalletStatusMatch on WalletStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() clientLoaded}) {
    final v = this;
    if (v == WalletStatus.initial) {
      return initial();
    }

    if (v == WalletStatus.loading) {
      return loading();
    }

    if (v == WalletStatus.loaded) {
      return loaded();
    }

    if (v == WalletStatus.error) {
      return error();
    }

    if (v == WalletStatus.clientLoaded) {
      return clientLoaded();
    }

    throw Exception('WalletStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? clientLoaded}) {
    final v = this;
    if (v == WalletStatus.initial && initial != null) {
      return initial();
    }

    if (v == WalletStatus.loading && loading != null) {
      return loading();
    }

    if (v == WalletStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == WalletStatus.error && error != null) {
      return error();
    }

    if (v == WalletStatus.clientLoaded && clientLoaded != null) {
      return clientLoaded();
    }

    return any();
  }
}
