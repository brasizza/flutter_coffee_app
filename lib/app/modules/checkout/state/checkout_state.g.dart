// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension CheckoutStatusMatch on CheckoutStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error,
      required T Function() itemAdd,
      required T Function() itemRemoved,
      required T Function() modifyItem,
      required T Function() refresh}) {
    final v = this;
    if (v == CheckoutStatus.initial) {
      return initial();
    }

    if (v == CheckoutStatus.loading) {
      return loading();
    }

    if (v == CheckoutStatus.loaded) {
      return loaded();
    }

    if (v == CheckoutStatus.error) {
      return error();
    }

    if (v == CheckoutStatus.itemAdd) {
      return itemAdd();
    }

    if (v == CheckoutStatus.itemRemoved) {
      return itemRemoved();
    }

    if (v == CheckoutStatus.modifyItem) {
      return modifyItem();
    }

    if (v == CheckoutStatus.refresh) {
      return refresh();
    }

    throw Exception('CheckoutStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error,
      T Function()? itemAdd,
      T Function()? itemRemoved,
      T Function()? modifyItem,
      T Function()? refresh}) {
    final v = this;
    if (v == CheckoutStatus.initial && initial != null) {
      return initial();
    }

    if (v == CheckoutStatus.loading && loading != null) {
      return loading();
    }

    if (v == CheckoutStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == CheckoutStatus.error && error != null) {
      return error();
    }

    if (v == CheckoutStatus.itemAdd && itemAdd != null) {
      return itemAdd();
    }

    if (v == CheckoutStatus.itemRemoved && itemRemoved != null) {
      return itemRemoved();
    }

    if (v == CheckoutStatus.modifyItem && modifyItem != null) {
      return modifyItem();
    }

    if (v == CheckoutStatus.refresh && refresh != null) {
      return refresh();
    }

    return any();
  }
}
