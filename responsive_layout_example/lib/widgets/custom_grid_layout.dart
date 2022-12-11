import 'package:flutter/material.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        // TRY THIS: Try changing the direction here and hot-reloading to
        // see the layout change.
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: ExampleWidget(),
        ),
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  ExampleWidget({super.key});

  final _colors = List.generate(12, (index) => Colors.primaries[index]);

  @override
  Widget build(BuildContext context) {
    final children = <GridChild>[
      for (var color in _colors)
        GridChild(
          id: color,
          child: Container(
            color: color,
            alignment: Alignment.center,
            child: Text(color.toString()),
          ),
        ),
    ];

    return CustomMultiChildLayout(
      delegate: GridDelegate(
        columns: 12,
        spacing: 8,
        outerSpacing: 16,
        children: children,
      ),
      children: <Widget>[
        // Create all of the colored boxes in the colors map.
        for (var color in _colors)
          // The "id" can be any Object, not just a String.
          LayoutId(
            id: color,
            child: Container(
              color: color,
              alignment: Alignment.center,
              child: Text(color.toString()),
            ),
          ),
      ],
    );
  }
}

class GridDelegate extends MultiChildLayoutDelegate {
  final int columns;
  final double spacing;
  final double outerSpacing;

  final List<GridChild> children;

  GridDelegate({
    required this.columns,
    required this.spacing,
    required this.outerSpacing,
    required this.children,
  });

  @override
  void performLayout(Size size) {
    final innerSpacers = columns - 1;

    final spacerWidth = spacing * innerSpacers + 2 * outerSpacing;

    final spaceAvailable = size.width - spacerWidth;

    final double columnWidth = spaceAvailable / columns;

    var childPosition = Offset(outerSpacing, 0);

    for (var child in children) {
      // layoutChild must be called exactly once for each child.

      final width = child.columnSpan * columnWidth + (child.columnSpan - 1) * spacing;

      final Size childSize = layoutChild(
        child.id,
        BoxConstraints(
          maxHeight: size.height,
          maxWidth: child.columnSpan * columnWidth + (child.columnSpan - 1) * spacing,
        ),
      );

      // positionChild must be called to change the position of a child from
      // what it was in the previous layout. Each child starts at (0, 0) for the
      // first layout.
      positionChild(child.id, childPosition);
      childPosition += Offset(childSize.width + spacing, 0);
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}

class GridChild {
  final Object id;
  final Widget child;
  final int columnSpan;

  GridChild({
    required this.id,
    required this.child,
    this.columnSpan = 1,
  });
}
