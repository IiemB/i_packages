import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_packages/configs/configs.dart';

class ICard extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final Color? borderColor;
  const ICard({
    Key? key,
    this.child,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Get.theme.inputDecorationTheme.fillColor,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: IStyles.borderRadiusAll,
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      child: child,
    );
  }
}
