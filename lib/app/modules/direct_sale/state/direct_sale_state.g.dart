// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direct_sale_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension DirectSaleStatusMatch on DirectSaleStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == DirectSaleStatus.initial) {
      return initial();
    }

    if (v == DirectSaleStatus.loading) {
      return loading();
    }

    if (v == DirectSaleStatus.loaded) {
      return loaded();
    }

    if (v == DirectSaleStatus.error) {
      return error();
    }

    throw Exception('DirectSaleStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == DirectSaleStatus.initial && initial != null) {
      return initial();
    }

    if (v == DirectSaleStatus.loading && loading != null) {
      return loading();
    }

    if (v == DirectSaleStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == DirectSaleStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
