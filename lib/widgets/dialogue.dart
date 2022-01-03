import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_packages/configs/configs.dart';
import 'package:sms_autofill/sms_autofill.dart';

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

  static Future<void> showVerificationOTPDialogue({
    required void Function()? onPressed,
    bool? barrierDismissible,
    Color? backgroundColor,
    dynamic Function(String)? onCodeSubmitted,
    dynamic Function(String)? onCodeChanged,
    String? currentCode,
  }) async {
    if (Get.isDialogOpen!) {
      Get.back();
    }

    const OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: IStyles.borderRadiusAll,
      borderSide: BorderSide(color: Colors.blueGrey),
    );

    await Get.defaultDialog(
      radius: IStyles.radiusValue,
      barrierDismissible: barrierDismissible ?? true,
      title: 'Enter the verification code'.tr,
      backgroundColor: backgroundColor,
      content: Column(
        children: [
          Text(
            'Please enter the verification code sent to your phone number'.tr,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFieldPinAutoFill(
              autoFocus: true,
              onCodeSubmitted: onCodeSubmitted,
              onCodeChanged: onCodeChanged,
              currentCode: currentCode,
              decoration: InputDecoration(
                hintText: 'Enter code'.tr,
                border: _border,
                errorBorder: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                disabledBorder: _border,
              ),
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: Get.width / 2,
          child: ElevatedButton(
            onPressed: onPressed,
            style: IStyles.elevatedButtonStyle(
              primary: Get.theme.colorScheme.secondary,
            ),
            child: Text(
              'Confirm'.tr,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
