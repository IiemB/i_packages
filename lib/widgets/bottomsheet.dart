import 'package:flutter/material.dart';

class IBottomSheet extends StatelessWidget {
  final Widget child;
  const IBottomSheet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: child,
      ),
    );
  }
}
