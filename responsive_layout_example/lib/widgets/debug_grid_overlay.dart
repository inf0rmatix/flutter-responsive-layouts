import 'package:flutter/material.dart';

class DebugGridOverlay extends StatelessWidget {
  static const defaultAlpha = 25;

  final int columns;

  final double columnSpacing;

  final Widget child;

  final Color color;

  final int alpha;

  final bool isGridVisible;

  const DebugGridOverlay({
    required this.child,
    this.isGridVisible = true,
    this.color = Colors.white,
    this.alpha = defaultAlpha,
    this.columns = 12,
    this.columnSpacing = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isGridVisible)
          Positioned.fill(
            child: IgnorePointer(
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: columnSpacing,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      color: Colors.amber,
                    ),
                  ),
                  ...List.generate(
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
                  ).expand(
                    (element) => [
                      element,
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
