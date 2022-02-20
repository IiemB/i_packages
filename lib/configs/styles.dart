import 'package:flutter/material.dart';

class IStyles {
  IStyles._();

  /// radiusValue
  static const double radiusValue = 16;

  /// [ElevatedButton.styleFrom] with radius value from [IStyles.radiusValue]
  static ButtonStyle elevatedButtonStyle({Color? primary, Color? onPrimary}) {
    return ElevatedButton.styleFrom(
      primary: primary,
      onPrimary: onPrimary,
      enableFeedback: true,
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadiusAll,
      ),
    );
  }

  /// [RoundedRectangleBorder] with radius value from [IStyles.radiusValue]
  static const ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
  );

  /// [BorderRadius] with radius value from [IStyles.radiusValue]
  static const BorderRadius borderRadiusAll =
      BorderRadius.all(Radius.circular(radiusValue));

  /// [Radius] with radius value from [IStyles.radiusValue]
  static const Radius radiusCircular = Radius.circular(radiusValue);
}
