import 'package:flutter/widgets.dart';

import 'row_layout.dart';

class CustomRowDelegate extends MultiChildLayoutDelegate {
  final int columns;
  final double spacing;
  final double outerSpacing;

  final List<RowElementInfo> elements;

  /// This is a workaround to prevent small white lines between columns when no spacing is used.
  final bool isSubpixelRenderingFixEnabled;

  CustomRowDelegate({
    required this.columns,
    required this.spacing,
    required this.outerSpacing,
    required this.elements,
    this.isSubpixelRenderingFixEnabled = true,
  }) {
    sanityCheck();
  }

  @override
  void performLayout(Size size) {
    final innerSpacers = columns - 1;

    final spacerWidth = spacing * innerSpacers + 2 * outerSpacing;

    final spaceAvailable = size.width - spacerWidth;

    double columnWidth = spaceAvailable / columns;

    var nextChildPosition = Offset(outerSpacing, 0);

    if (isSubpixelRenderingFixEnabled && spacing == 0) {
      // Flutters rendering engine is capable of drawing accurate to 0.5 of a pixel
      final roundingOverhead = columnWidth % 0.5;

      columnWidth = columnWidth - roundingOverhead;

      final totalRoundingOverhead = spaceAvailable - (columnWidth * columns);

      if (outerSpacing > 0) {
        nextChildPosition = Offset(outerSpacing + totalRoundingOverhead / 2, 0);
      }
    }

    for (var element in elements) {
      var width = element.columnSpan * columnWidth + (element.columnSpan - 1) * spacing;

      final id = element.id;

      if (id == null) {
        throw Exception("The id of a GridElementInfo can't be null.");
      }

      // layoutChild must be called exactly once for each child.
      final Size childSize = layoutChild(
        id,
        BoxConstraints(
          maxHeight: size.height,
          maxWidth: width,
        ),
      );

      // positionChild must be called to change the position of a child from
      // what it was in the previous layout. Each child starts at (0, 0) for the
      // first layout.
      positionChild(id, nextChildPosition);

      nextChildPosition += Offset(childSize.width + spacing, 0);
    }
  }

  @override
  bool shouldRelayout(CustomRowDelegate oldDelegate) {
    return oldDelegate.columns != columns ||
        oldDelegate.spacing != spacing ||
        oldDelegate.outerSpacing != outerSpacing ||
        oldDelegate.elements != elements ||
        oldDelegate.isSubpixelRenderingFixEnabled != isSubpixelRenderingFixEnabled;
  }

  void sanityCheck() {
    final columnsFilled =
        elements.map((element) => element.columnSpan).reduce((value, columnSpan) => value += columnSpan);

    if (columnsFilled > columns) {
      throw Exception("The sum of the column spans of all elements can't be greater than the number of columns.");
    }
  }
}
