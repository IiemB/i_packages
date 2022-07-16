import 'package:flutter/material.dart';

import 'widgets.dart';

class IBaseSheet extends StatelessWidget {
  final Widget? title;
  final List<Widget> content;
  final Color? backgroundColor;
  final Future<bool> Function()? onWillPop;
  final bool isDraggable;
  const IBaseSheet({
    Key? key,
    this.title,
    required this.content,
    this.backgroundColor,
    this.onWillPop,
    this.isDraggable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: isDraggable
          ? DraggableScrollableSheet(
              maxChildSize: 0.95,
              expand: false,
              snap: true,
              builder: (context, scrollController) => Container(
                color: backgroundColor ??
                    Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(child: ITopBar()),
                      if (title != null) ...[
                        title!,
                        const IGap(),
                      ],
                      ...content
                    ],
                  ),
                ),
              ),
            )
          : BottomSheet(
              enableDrag: false,
              onClosing: () {},
              builder: (context) => Container(
                color: backgroundColor ??
                    Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(child: ITopBar()),
                      if (title != null) ...[
                        title!,
                        const IGap(),
                      ],
                      ...content
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
