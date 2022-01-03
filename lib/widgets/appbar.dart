import 'package:flutter/material.dart';
import 'package:i_packages/configs/configs.dart';

class IAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onTitlePressed;
  final bool? automaticallyImplyLeading;
  final bool? centerTitle;
  final Widget? leading;

  @override
  final Size preferredSize;

  const IAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.onTitlePressed,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.leading,
    this.preferredSize = const Size.fromHeight(73),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: AppBar(
            centerTitle: centerTitle,
            elevation: 0,
            leading: leading,
            automaticallyImplyLeading: automaticallyImplyLeading!,
            shape: IStyles.shape,
            title: GestureDetector(
              onDoubleTap: onTitlePressed,
              child: Text(
                title,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            actions: actions,
          ),
        ),
      ),
    );
  }
}
