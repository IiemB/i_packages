import 'package:flutter/material.dart';
import 'package:i_packages/configs/configs.dart';

class ISnackbar {
  ISnackbar._();

  static Future<void> showErrorSnakbar(
    BuildContext context, {
    required String message,
    bool clearQueue = true,
    SnackBarAction? action,
  }) async {
    if (clearQueue) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: action,
        backgroundColor: Theme.of(context).errorColor,
        shape: IStyles.shape,
      ),
    );
  }

  static Future<void> showSuccessSnackbar(
    BuildContext context, {
    required String message,
    bool clearQueue = true,
    SnackBarAction? action,
  }) async {
    if (clearQueue) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: action,
        backgroundColor: Theme.of(context).errorColor,
        shape: IStyles.shape,
      ),
    );
  }
}
