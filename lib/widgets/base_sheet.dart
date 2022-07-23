import 'package:flutter/material.dart';

import 'widgets.dart';

class IBaseSheet extends StatelessWidget {
  IBaseSheet({
    Key? key,
    Widget? title,
    required List<Widget> content,
    Color? backgroundColor,
    Future<bool> Function()? onWillPop,
    bool isDraggable = true,
  })  : widget = WillPopScope(
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
                            title,
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
                            title,
                            const IGap(),
                          ],
                          ...content
                        ],
                      ),
                    ),
                  ),
                ),
        ),
        super(key: key);

  IBaseSheet.custom({
    Key? key,
    Future<bool> Function()? onWillPop,
    required DraggableScrollableSheet draggableScrollableSheet,
  })  : widget = WillPopScope(
          onWillPop: onWillPop,
          child: draggableScrollableSheet,
        ),
        super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
