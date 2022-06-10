import 'package:flutter/material.dart';
import 'package:i_packages/i_packages.dart';

class ITopBar extends StatelessWidget {
  const ITopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: context.width / 5,
      height: 8,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onBackground.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
