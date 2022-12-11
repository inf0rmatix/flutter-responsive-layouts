// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ExampleWidget(),
      ),
    );
  }
}

class ExampleWidget extends StatelessWidget {
  ExampleWidget({super.key});

  final _colors = List.generate(12, (index) => Colors.primaries[index]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomGridLayout(
            elements: _colors
                .map((color) => GridElement(
                      child: Container(
                        color: color,
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: CustomGridLayout(
            elements: _colors.reversed
                .toList()
                .sublist(0, 6)
                .map((color) => GridElement(
                      data: const GridElementInfo(columnSpan: 2),
                      child: Container(
                        color: color,
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: CustomGridLayout(
            elements: _colors
                .sublist(0, 3)
                .map((color) => GridElement(
                      data: const GridElementInfo(columnSpan: 4),
                      child: Container(
                        color: color,
                      ),
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: CustomGridLayout(
            elements: [
              GridElement(
                data: const GridElementInfo(columnSpan: 12),
                child: Container(
                  color: _colors.last,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: CustomGridLayout(
            elements: [
              GridElement(
                data: const GridElementInfo(columnSpan: 7),
                child: Container(
                  color: _colors.first,
                ),
              ),
              GridElement(
                data: const GridElementInfo(columnSpan: 5),
                child: Container(
                  color: _colors[1],
                ),
              )
            ],
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

  final List<GridElementInfo> elements;

  GridDelegate({
    required this.columns,
    required this.spacing,
    required this.outerSpacing,
    required this.elements,
  }) {
    sanityCheck();
  }

  @override
  void performLayout(Size size) {
    final innerSpacers = columns - 1;

    final spacerWidth = spacing * innerSpacers + 2 * outerSpacing;

    final spaceAvailable = size.width - spacerWidth;

    debugPrint("");

    debugPrint("size.width: ${size.width}");

    debugPrint("spaceAvailable: $spaceAvailable");

    final double columnWidth = spaceAvailable / columns;

    var childPosition = Offset(outerSpacing, 0);

    for (var element in elements) {
      final width = element.columnSpan * columnWidth + (element.columnSpan - 1) * spacing;

      debugPrint("width: $width");

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
      positionChild(id, childPosition);

      childPosition += Offset(childSize.width + spacing, 0);
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }

  void sanityCheck() {
    final columnsFilled =
        elements.map((element) => element.columnSpan).reduce((value, columnSpan) => value += columnSpan);

    if (columnsFilled > columns) {
      throw Exception("The sum of the column spans of all elements can't be greater than the number of columns.");
    }
  }
}

class GridElement {
  final GridElementInfo data;
  final Widget child;

  GridElement({
    this.data = const GridElementInfo(),
    required this.child,
  });
}

class GridElementInfo {
  final int columnSpan;
  final Object? id;

  const GridElementInfo({
    this.id,
    this.columnSpan = 1,
  });

  GridElementInfo copyWith({
    int? columnSpan,
    Object? id,
  }) {
    return GridElementInfo(
      columnSpan: columnSpan ?? this.columnSpan,
      id: id ?? this.id,
    );
  }
}

class CustomGridLayout extends StatefulWidget {
  final int columns;

  final double? spacing;

  final double? outerSpacing;

  final List<GridElement> elements;

  const CustomGridLayout({
    required this.elements,
    this.columns = 12,
    this.spacing,
    this.outerSpacing,
    super.key,
  });

  @override
  State<CustomGridLayout> createState() => _CustomGridLayoutState();
}

class _CustomGridLayoutState extends State<CustomGridLayout> {
  final List<Widget> _children = [];

  final List<GridElementInfo> _elements = [];

  @override
  void initState() {
    super.initState();

    _setupChildrenAndData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _setupChildrenAndData();
  }

  @override
  void didUpdateWidget(covariant CustomGridLayout oldWidget) {
    super.didUpdateWidget(oldWidget);

    _setupChildrenAndData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: GridDelegate(
        columns: widget.columns,
        spacing: widget.spacing ?? 0,
        outerSpacing: widget.outerSpacing ?? 0,
        elements: _elements,
      ),
      children: _children,
    );
  }

  void _setupChildrenAndData() {
    _children.clear();
    _elements.clear();

    for (var element in widget.elements) {
      final id = element.data.id ?? element.child.key ?? widget.elements.indexOf(element);

      final data = element.data.copyWith(id: id);

      _elements.add(data);

      _children.add(
        LayoutId(
          id: id,
          child: element.child,
        ),
      );
    }
  }
}
