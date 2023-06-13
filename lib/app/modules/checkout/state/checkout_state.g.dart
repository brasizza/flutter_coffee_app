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
      required T Function() refresh,
      required T Function() errorRange,
      required T Function() askToRemove,
      required T Function() askToClearAll,
      required T Function() cancelProcess}) {
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

    if (v == CheckoutStatus.errorRange) {
      return errorRange();
    }

    if (v == CheckoutStatus.askToRemove) {
      return askToRemove();
    }

    if (v == CheckoutStatus.askToClearAll) {
      return askToClearAll();
    }

    if (v == CheckoutStatus.cancelProcess) {
      return cancelProcess();
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
      T Function()? refresh,
      T Function()? errorRange,
      T Function()? askToRemove,
      T Function()? askToClearAll,
      T Function()? cancelProcess}) {
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

    if (v == CheckoutStatus.errorRange && errorRange != null) {
      return errorRange();
    }

    if (v == CheckoutStatus.askToRemove && askToRemove != null) {
      return askToRemove();
    }

    if (v == CheckoutStatus.askToClearAll && askToClearAll != null) {
      return askToClearAll();
    }

    if (v == CheckoutStatus.cancelProcess && cancelProcess != null) {
      return cancelProcess();
    }

    return any();
  }
}
