import 'package:flutter/material.dart';

class IGap extends StatelessWidget {
  final double dimension;
  const IGap({
    Key? key,
    this.dimension = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: dimension);
  }
}
