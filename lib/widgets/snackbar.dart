import 'package:flutter/material.dart';
import 'package:i_packages/i_packages.dart';

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
        action: action ??
            SnackBarAction(
              label: 'Hide',
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
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
        action: action ??
            SnackBarAction(
              label: 'Hide',
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
        shape: IStyles.shape,
      ),
    );
  }

  static Future<void> showLoadingSnackbar(
    BuildContext context, {
    bool clearQueue = true,
    String loadingText = 'Loading',
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 30),
  }) async {
    if (clearQueue) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: ISizer.widthPercent(context, 5),
              child: const CircularProgressIndicator(),
            ),
            const IGap(),
            Text(loadingText),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        action: action ??
            SnackBarAction(
              label: 'Hide',
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
        shape: IStyles.shape,
        duration: duration,
      ),
    );
  }

  static void clearSnackBars(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}
