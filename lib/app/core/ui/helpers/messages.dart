import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String mensagem) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: mensagem,
      ),
    );
  }

  void showInfo(String mensagem) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: mensagem,
      ),
    );
  }

  void showSuccess(String mensagem) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: mensagem,
      ),
    );
  }
}
