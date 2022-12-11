// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'row_layout.dart';

class CustomRowLayout extends StatefulWidget {
  final int columns;

  final double? spacing;

  final double? outerSpacing;

  final List<RowElement> elements;

  /// This is a workaround to prevent small white lines between columns when no spacing is used. This will add padding to the right of the grid.
  final bool isSubpixelRenderingFixEnabled;

  const CustomRowLayout({
    required this.elements,
    this.columns = 12,
    this.spacing,
    this.outerSpacing,
    this.isSubpixelRenderingFixEnabled = false,
    super.key,
  });

  @override
  State<CustomRowLayout> createState() => _CustomRowLayoutState();
}

class _CustomRowLayoutState extends State<CustomRowLayout> {
  final List<Widget> _children = [];

  final List<RowElementInfo> _elements = [];

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
  void didUpdateWidget(covariant CustomRowLayout oldWidget) {
    super.didUpdateWidget(oldWidget);

    _setupChildrenAndData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: CustomRowDelegate(
        columns: widget.columns,
        spacing: widget.spacing ?? 0,
        outerSpacing: widget.outerSpacing ?? 0,
        elements: _elements,
        isSubpixelRenderingFixEnabled: widget.isSubpixelRenderingFixEnabled,
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
