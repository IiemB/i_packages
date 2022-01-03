import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_packages/configs/configs.dart';
import 'package:line_icons/line_icons.dart';

class ISnackbar {
  static Future<void> showErrorSnakbar({
    required String? title,
    required String? message,
    void Function(GetSnackBar)? onTap,
  }) async {
    Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.TOP,
        icon: Icon(
          LineIcons.exclamation,
          color: Get.theme.colorScheme.onSecondary,
        ),
        message: message,
        title: title,
        isDismissible: true,
        margin: const EdgeInsets.all(8),
        duration: const Duration(seconds: 3),
        borderRadius: IStyles.radiusValue,
        backgroundColor: Get.theme.errorColor,
        onTap: onTap,
      ),
    );
  }

  static Future<void> showSuccessSnackbar({
    required String? title,
    required String? message,
    required bool isSad,
    required void Function(GetSnackBar)? onTap,
  }) async {
    Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.TOP,
        icon: isSad
            ? Icon(
                LineIcons.frowningFace,
                color: Get.theme.colorScheme.onSecondary,
              )
            : Icon(
                LineIcons.smilingFace,
                color: Get.theme.colorScheme.onSecondary,
              ),
        message: message,
        title: title,
        isDismissible: true,
        margin: const EdgeInsets.all(8),
        duration: const Duration(seconds: 3),
        borderRadius: IStyles.radiusValue,
        backgroundColor: Get.theme.colorScheme.primary,
        onTap: onTap,
      ),
    );
  }
}
