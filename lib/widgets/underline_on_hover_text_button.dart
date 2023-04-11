import 'package:flutter/material.dart';

class BorderOnHoverWidget extends StatelessWidget {
  BorderOnHoverWidget({super.key, required this.child, required this.border});

  final showBorderNotifier = ValueNotifier<bool>(false);
  final Widget child;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: showBorderNotifier,
      builder: (context, showBorder, _) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: showBorder ? border : null,
          ),
          child: InkWell(
            onTap: () {},
            onHover: (hovered) {
              showBorderNotifier.value = hovered;
            },
            child: child,
          ),
        );
      },
    );
  }
}
