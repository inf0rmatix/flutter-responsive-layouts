import 'package:flutter/material.dart';

class DebugGridOverlay extends StatelessWidget {
  static const defaultAlpha = 25;

  final int columns;

  final double columnSpacing;

  final Widget child;

  final Color color;

  final int alpha;

  final bool isGridVisible;

  final bool hasOuterColumnSpacing;

  const DebugGridOverlay({
    required this.child,
    this.isGridVisible = true,
    this.color = Colors.white,
    this.alpha = defaultAlpha,
    this.columns = 12,
    this.columnSpacing = 16,
    this.hasOuterColumnSpacing = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final columnMarkers = List.generate(
      columns,
      (index) => Expanded(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: color.withAlpha(alpha),
              border: Border.all(color: Colors.black),
            ),
            width: double.infinity,
            child: Center(child: Text(constraints.biggest.width.toStringAsFixed(0))),
          );
        }),
      ),
    );

    return Stack(
      children: [
        child,
        if (isGridVisible)
          Positioned.fill(
            child: IgnorePointer(
              child: Row(
                children: [
                  if (hasOuterColumnSpacing)
                    SizedBox.square(
                      dimension: columnSpacing,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ...columnMarkers.expand(
                    (element) => [
                      element,
                      if (columnMarkers.indexOf(element) != columnMarkers.length - 1 || hasOuterColumnSpacing)
                        SizedBox.square(
                          dimension: columnSpacing,
                          child: Container(
                            width: double.infinity,
                            height: 350,
                            color: Colors.amber,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
