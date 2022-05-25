import 'package:flutter/material.dart';
import 'package:i_packages/i_packages.dart';

class ISnackbar {
  ISnackbar._();

  static Future<void> showErrorSnackBar(
    BuildContext context, {
    required String message,
    bool clearQueue = true,
    Duration snackBarDuration = const Duration(seconds: 4),
    String? actionLabel,
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
        action: actionLabel == null
            ? null
            : SnackBarAction(
                label: actionLabel,
                textColor: context.theme.bottomAppBarColor,
                onPressed: onAction ??
                    () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  static Future<void> showSuccessSnackBar(
    BuildContext context, {
    required String message,
    bool clearQueue = true,
    Duration snackBarDuration = const Duration(seconds: 4),
    String? actionLabel,
    void Function()? onAction,
  }) async {
    if (clearQueue) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: actionLabel == null
            ? null
            : SnackBarAction(
                label: actionLabel,
                textColor: context.theme.bottomAppBarColor,
                onPressed: onAction ??
                    () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ),
      ),
    );
  }

  static Future<void> showLoadingSnackBar(
    BuildContext context, {
    bool clearQueue = true,
    required String loadingText,
    Duration duration = const Duration(seconds: 30),
    String? actionLabel,
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
        action: actionLabel == null
            ? null
            : SnackBarAction(
                label: actionLabel,
                textColor: context.theme.bottomAppBarColor,
                onPressed: onAction ??
                    () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ),
        duration: duration,
      ),
    );
  }

  static Future<void> clearSnackBars(BuildContext context) async {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}
