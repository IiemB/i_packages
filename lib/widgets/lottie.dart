import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ILottie extends StatelessWidget {
  final ILottieStyle iLottieStyle;
  final FrameRate? frameRate;
  final BoxFit fit;
  final double? width;
  const ILottie({
    Key? key,
    required this.iLottieStyle,
    this.frameRate,
    this.fit = BoxFit.contain,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        switch (iLottieStyle) {
          case ILottieStyle.emptyStateTumbleWeed:
            return Lottie.asset(
              'assets/lottie/empty_state_tumbleweed.zip',
              frameRate: frameRate ?? FrameRate.max,
              fit: fit,
              width: width,
              package: 'i_packages',
            );
          case ILottieStyle.loadingCoffeeBeans:
            return Lottie.asset(
              'assets/lottie/loading_coffee_beans.zip',
              frameRate: frameRate ?? FrameRate.max,
              fit: fit,
              width: width,
              package: 'i_packages',
            );
          case ILottieStyle.profilePeopleMorph:
            return Lottie.asset(
              'assets/lottie/people_morph_flow.zip',
              frameRate: frameRate ?? FrameRate.max,
              fit: fit,
              width: width,
              package: 'i_packages',
            );
        }
      },
    );
  }
}

enum ILottieStyle {
  emptyStateTumbleWeed,
  loadingCoffeeBeans,
  profilePeopleMorph,
}
