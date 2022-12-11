// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'custom_row_delegate.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ExampleWidget(),
      ),
    );
  }
}

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  bool isSpacingEnabled = true;
  bool isOuterSpacingEnabled = true;
  bool isSubpixelRenderingFixEnabled = false;

  final spacing = 16.0;

  final outerSpacing = 16.0;

  final columns = 12;

  final _colors = Colors.primaries.sublist(0, 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: spacing,
        children: [
          FloatingActionButton(
            child: Icon(isOuterSpacingEnabled ? Icons.margin_rounded : Icons.margin),
            onPressed: () => setState(() => isOuterSpacingEnabled = !isOuterSpacingEnabled),
          ),
          FloatingActionButton(
            child: Icon(isSpacingEnabled ? Icons.space_dashboard : Icons.space_dashboard_outlined),
            onPressed: () => setState(() => isSpacingEnabled = !isSpacingEnabled),
          ),
          FloatingActionButton(
            child: Icon(isSubpixelRenderingFixEnabled ? Icons.bug_report_rounded : Icons.bug_report_outlined),
            onPressed: () => setState(() => isSubpixelRenderingFixEnabled = !isSubpixelRenderingFixEnabled),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomRowLayout(
              spacing: isSpacingEnabled ? spacing : null,
              outerSpacing: isOuterSpacingEnabled ? outerSpacing : null,
              isSubpixelRenderingFixEnabled: isSubpixelRenderingFixEnabled,
              columns: columns,
              elements: _colors
                  .map((color) => RowElement(
                        child: Container(
                          color: color,
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: CustomRowLayout(
              spacing: isSpacingEnabled ? spacing : null,
              outerSpacing: isOuterSpacingEnabled ? outerSpacing : null,
              isSubpixelRenderingFixEnabled: isSubpixelRenderingFixEnabled,
              columns: columns,
              elements: _colors.reversed
                  .toList()
                  .sublist(0, 6)
                  .map((color) => RowElement(
                        data: const RowElementInfo(columnSpan: 2),
                        child: Container(
                          color: color,
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: CustomRowLayout(
              spacing: isSpacingEnabled ? spacing : null,
              outerSpacing: isOuterSpacingEnabled ? outerSpacing : null,
              isSubpixelRenderingFixEnabled: isSubpixelRenderingFixEnabled,
              columns: columns,
              elements: _colors
                  .sublist(0, 3)
                  .map((color) => RowElement(
                        data: const RowElementInfo(columnSpan: 4),
                        child: Container(
                          color: color,
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: CustomRowLayout(
              spacing: isSpacingEnabled ? spacing : null,
              outerSpacing: isOuterSpacingEnabled ? outerSpacing : null,
              isSubpixelRenderingFixEnabled: isSubpixelRenderingFixEnabled,
              columns: columns,
              elements: [
                RowElement(
                  data: const RowElementInfo(columnSpan: 12),
                  child: Container(
                    color: _colors.last,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomRowLayout(
              spacing: isSpacingEnabled ? spacing : null,
              outerSpacing: isOuterSpacingEnabled ? outerSpacing : null,
              isSubpixelRenderingFixEnabled: isSubpixelRenderingFixEnabled,
              elements: [
                RowElement(
                  data: const RowElementInfo(columnSpan: 7),
                  child: Container(
                    color: _colors.first,
                  ),
                ),
                RowElement(
                  data: const RowElementInfo(columnSpan: 5),
                  child: Container(
                    color: _colors[1],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowElement {
  final RowElementInfo data;
  final Widget child;

  RowElement({
    this.data = const RowElementInfo(),
    required this.child,
  });
}

class RowElementInfo {
  final int columnSpan;
  final Object? id;

  const RowElementInfo({
    this.id,
    this.columnSpan = 1,
  });

  RowElementInfo copyWith({
    int? columnSpan,
    Object? id,
  }) {
    return RowElementInfo(
      columnSpan: columnSpan ?? this.columnSpan,
      id: id ?? this.id,
    );
  }
}

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
