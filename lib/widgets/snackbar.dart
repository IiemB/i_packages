import 'package:flutter/material.dart';
import 'package:i_packages/i_packages.dart';

class ISnackbar {
  ISnackbar._();

  static Future<void> showErrorSnakbar(
    BuildContext context, {
    required String message,
    bool clearQueue = true,
    Duration snackBarDuration = const Duration(seconds: 4),
    String actionLabel = 'Hide',
    void Function()? onAction,
  }) async {
    if (clearQueue) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: snackBarDuration,
        action: SnackBarAction(
          label: actionLabel,
          textColor: context.theme.bottomAppBarColor,
          onPressed: onAction ??
              () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
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
    Duration snackBarDuration = const Duration(seconds: 4),
    String actionLabel = 'Hide',
    void Function()? onAction,
  }) async {
    if (clearQueue) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: actionLabel,
          textColor: context.theme.bottomAppBarColor,
          onPressed: onAction ??
              () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
        shape: IStyles.shape,
      ),
    );
  }

  static Future<void> showLoadingSnackbar(
    BuildContext context, {
    bool clearQueue = true,
    String loadingText = 'Loading',
    Duration duration = const Duration(seconds: 30),
    String actionLabel = 'Hide',
    void Function()? onAction,
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
              dimension: context.widthByPercent(5),
              child: const CircularProgressIndicator(),
            ),
            const IGap(),
            Text(loadingText),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: actionLabel,
          textColor: context.theme.bottomAppBarColor,
          onPressed: onAction ??
              () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
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
