import 'package:flutter/material.dart';
import 'package:i_packages/i_packages.dart';

class IDialogue {
  static bool isDialogueOpen = false;

  static Future<void> show(
    BuildContext context, {
    required Widget alertDialog,
    Future<bool> Function()? onWillPop,
    bool barrierDismissible = true,
    Color? backgroundColor,
  }) async {
    isDialogueOpen = true;

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: onWillPop,
          child: alertDialog,
        );
      },
    ).whenComplete(() => isDialogueOpen = false);
  }

  static Future<void> showLoadingDialogue(
    BuildContext context, {
    Widget? content,
    bool barrierDismissible = true,
    Color? backgroundColor,
    Future<bool> Function()? onWillPop,
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
                SizedBox.square(
                  dimension: ISizer.widthPercent(context, 10),
                  child: const CircularProgressIndicator(),
                ),
            backgroundColor: backgroundColor,
            shape: IStyles.shape,
          ),
        );
      },
    ).whenComplete(() => isDialogueOpen = false);
  }

  static Future<void> showConfirmDialogue(
    BuildContext context, {
    required String title,
    String middleText = '',
    Widget? content,
    bool barrierDismissible = true,
    List<Widget>? actions,
    Color? backgroundColor,
    void Function()? onConfirm,
    void Function()? onCancel,
    TextStyle? titleStyle,
    TextStyle? middleTextStyle,
    Future<bool> Function()? onWillPop,
  }) async {
    isDialogueOpen = true;

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: onWillPop,
          child: AlertDialog(
            backgroundColor: backgroundColor,
            shape: IStyles.shape,
            title: Text(title),
            content: Text(middleText),
            titleTextStyle: titleStyle,
            actions: actions ??
                [
                  TextButton(onPressed: onCancel, child: const Text('No')),
                  TextButton(onPressed: onConfirm, child: const Text('Yes')),
                ],
          ),
        );
      },
    ).whenComplete(() => isDialogueOpen = false);
  }

  static Future<void> showErrorDialogue(
    BuildContext context, {
    required String middleText,
    bool barrierDismissible = true,
    Color? backgroundColor,
  }) async {
    if (isDialogueOpen) {
      Navigator.pop(context);
    }

    isDialogueOpen = true;

    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: IStyles.shape,
          title: const Text('Error'),
          content: Text(middleText),
          actions: [
            TextButton(
              style: IStyles.elevatedButtonStyle(
                primary: IThemes.theme(context).colorScheme.secondary,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    ).whenComplete(() => isDialogueOpen = false);
  }
}
