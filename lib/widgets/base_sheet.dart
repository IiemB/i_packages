import 'package:flutter/material.dart';

import 'widgets.dart';

class IBaseSheet extends StatelessWidget {
  final Widget title;
  final List<Widget> content;
  final Color? backgroundColor;
  final Future<bool> Function()? onWillPop;
  const IBaseSheet({
    Key? key,
    required this.title,
    required this.content,
    this.backgroundColor,
    this.onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: DraggableScrollableSheet(
        maxChildSize: 0.9,
        expand: false,
        snap: true,
        builder: (context, scrollController) => Container(
          color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(child: ITopBar()),
                title,
                const IGap(),
                ...content
              ],
            ),
          ),
        ),
      ),
    );
  }
}
