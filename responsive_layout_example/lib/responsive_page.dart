import 'package:flutter/material.dart';
import 'package:responsive_layout_example/examples/address_form_with_flex_advanced.dart';
import 'package:responsive_layout_example/examples/address_form_with_flex_simple.dart';
import 'package:responsive_layout_example/examples/address_form_with_wrap.dart';
import 'package:responsive_layout_example/widgets/debug_grid_overlay.dart';

class ResponsivePage extends StatefulWidget {
  const ResponsivePage({super.key});

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  bool isGridVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => isGridVisible = !isGridVisible),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'It \'s a Wrap'),
                Tab(text: 'Flexin\''),
                Tab(text: 'Flex with extra steps'),
              ],
            ),
            Expanded(
              child: DebugGridOverlay(
                isGridVisible: isGridVisible,
                child: TabBarView(
                  children: [
                    ListView(
                      children: const [
                        AddressFormWithWrap(),
                      ],
                    ),
                    ListView(
                      children: const [
                        AddressFormWithFlexSimple(),
                      ],
                    ),
                    LayoutBuilder(builder: (context, constraints) {
                      final isSmall = constraints.maxWidth < 600;

                      return ListView(
                        children: [
                          AddressFormWithFlexAdvanced(isSmall: isSmall),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
