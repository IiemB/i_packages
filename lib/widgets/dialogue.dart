import 'package:flutter/material.dart';
import 'package:i_packages/i_packages.dart';

class IDialogue {
  static bool isDialogueOpen = false;

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget alertDialog,
    Future<bool> Function()? onWillPop,
    bool barrierDismissible = true,
    Color? backgroundColor,
  }) async {
    isDialogueOpen = true;

    final _result = await showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: onWillPop,
          child: alertDialog,
        );
      },
    ).whenComplete(() => isDialogueOpen = false);

    return _result;
  }

  static Future<void> showLoadingDialogue(
    BuildContext context, {
    Widget? content,
    bool barrierDismissible = true,
    Color? backgroundColor,
    Future<bool> Function()? onWillPop,
    String loadingText = 'Loading',
  }) async {
    isDialogueOpen = true;

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: onWillPop,
          child: AlertDialog(
            content: content ??
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.square(
                      dimension: context.width / 10,
                      child: const CircularProgressIndicator(),
                    ),
                    const IGap(),
                    Text(loadingText)
                  ],
                ),
            backgroundColor: backgroundColor,
          ),
        );
      },
    ).whenComplete(() => isDialogueOpen = false);
  }

  static Future<T?> showConfirmDialogue<T>(
    BuildContext context, {
    required String title,
    String middleText = '',
    Widget? content,
    bool barrierDismissible = true,
    List<Widget>? actions,
    Color? backgroundColor,
    void Function()? onConfirm,
    String confirmText = 'OK',
    void Function()? onCancel,
    String cancelText = 'Cancel',
    TextStyle? titleStyle,
    TextStyle? middleTextStyle,
    Future<bool> Function()? onWillPop,
  }) async {
    isDialogueOpen = true;

    final _reslut = await showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: onWillPop,
          child: AlertDialog(
            backgroundColor: backgroundColor,
            title: Text(title),
            content: content ?? Text(middleText),
            titleTextStyle: titleStyle,
            actions: actions ??
                [
                  TextButton(onPressed: onCancel, child: Text(cancelText)),
                  TextButton(onPressed: onConfirm, child: Text(confirmText)),
                ],
          ),
        );
      },
    ).whenComplete(() => isDialogueOpen = false);

    return _reslut;
  }

  static Future<T?> showErrorDialogue<T>(
    BuildContext context, {
    required String middleText,
    bool barrierDismissible = true,
    Color? backgroundColor,
    String mainTextButton = 'OK',
  }) async {
    if (isDialogueOpen) {
      Navigator.pop(context);
    }

    isDialogueOpen = true;

    final _result = await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: const Text('Error'),
          content: Text(middleText),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(mainTextButton),
            ),
          ],
        );
      },
    ).whenComplete(() => isDialogueOpen = false);

    return _result;
  }
}
