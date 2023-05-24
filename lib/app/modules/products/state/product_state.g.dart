// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ProductStatusMatch on ProductStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() changeCategory}) {
    final v = this;
    if (v == ProductStatus.initial) {
      return initial();
    }

    if (v == ProductStatus.loading) {
      return loading();
    }

    if (v == ProductStatus.loaded) {
      return loaded();
    }

    if (v == ProductStatus.error) {
      return error();
    }

    if (v == ProductStatus.changeCategory) {
      return changeCategory();
    }

    throw Exception('ProductStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? changeCategory}) {
    final v = this;
    if (v == ProductStatus.initial && initial != null) {
      return initial();
    }

    if (v == ProductStatus.loading && loading != null) {
      return loading();
    }

    if (v == ProductStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == ProductStatus.error && error != null) {
      return error();
    }

    if (v == ProductStatus.changeCategory && changeCategory != null) {
      return changeCategory();
    }

    return any();
  }
}
