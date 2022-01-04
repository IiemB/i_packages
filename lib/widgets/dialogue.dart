import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_packages/configs/configs.dart';

class IDialogue {
  static Future<void> showLoadingDialogue({
    required String title,
    String middleText = '',
    Widget? content,
    bool? barrierDismissible,
    Color? backgroundColor,
    Future<bool> Function()? onWillPop,
  }) async {
    await Get.defaultDialog(
      radius: IStyles.radiusValue,
      barrierDismissible: barrierDismissible ?? true,
      title: title,
      onWillPop: onWillPop,
      middleText: middleText,
      content: content ?? const CircularProgressIndicator(),
      backgroundColor: backgroundColor,
      actions: [],
    );
  }

  static Future<void> showConfirmDialogue({
    required String title,
    String? middleText = '',
    Widget? content,
    bool? barrierDismissible,
    List<Widget>? actions,
    Color? backgroundColor,
    void Function()? onConfirm,
    void Function()? onCancel,
    TextStyle? titleStyle,
    TextStyle? middleTextStyle,
    Future<bool> Function()? onWillPop,
  }) async {
    await Get.defaultDialog(
      radius: IStyles.radiusValue,
      barrierDismissible: barrierDismissible ?? true,
      title: title,
      onWillPop: onWillPop,
      middleText: middleText!,
      content: content,
      titleStyle: titleStyle,
      middleTextStyle: middleTextStyle,
      backgroundColor: backgroundColor,
      actions: actions ??
          [
            SizedBox(
              width: Get.width / 4,
              child: ElevatedButton(
                style: IStyles.elevatedButtonStyle(
                  primary: Get.theme.colorScheme.secondary,
                ),
                onPressed: onCancel,
                child: Text(
                  'No'.tr,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: Get.width / 4,
              child: ElevatedButton(
                style: IStyles.elevatedButtonStyle(
                  primary: Get.theme.colorScheme.secondary,
                ),
                onPressed: onConfirm,
                child: Text(
                  'Yes'.tr,
                ),
              ),
            ),
          ],
    );
  }

  static Future<void> showErrorDialogue({
    required String? middleText,
    bool? barrierDismissible,
    Color? backgroundColor,
  }) async {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    await Get.defaultDialog(
      radius: IStyles.radiusValue,
      barrierDismissible: barrierDismissible ?? true,
      title: 'Error'.tr,
      middleText: middleText!,
      backgroundColor: backgroundColor,
      actions: [
        SizedBox(
          width: Get.width / 3,
          child: ElevatedButton(
            style: IStyles.elevatedButtonStyle(
              primary: Get.theme.colorScheme.secondary,
            ),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Ok'.tr,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
