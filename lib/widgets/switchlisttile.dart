import 'package:flutter/material.dart';
import 'package:i_packages/widgets/widgets.dart';

class ISwitchListTile extends StatelessWidget {
  final String title;
  final bool valueFromController;
  final Function(bool) onChanged;
  const ISwitchListTile({
    Key? key,
    required this.title,
    required this.valueFromController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ICard(
      child: SwitchListTile.adaptive(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        value: valueFromController,
        onChanged: onChanged,
      ),
    );
  }
}
