import 'package:flutter/material.dart';

import 'widgets/row_layout/row_layout.dart';

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
