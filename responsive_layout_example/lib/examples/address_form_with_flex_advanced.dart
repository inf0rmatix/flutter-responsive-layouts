import 'package:flutter/material.dart';
import 'package:responsive_layout_example/widgets/debug_grid_overlay.dart';

class AddressFormWithFlexAdvanced extends StatelessWidget {
  final bool isSmall;

  const AddressFormWithFlexAdvanced({
    required this.isSmall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Salutation'),
                  ),
                ),
              ),
            ],
          ),
          Flex(
            direction: isSmall ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isSmall ? 0 : 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Firstname'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                flex: isSmall ? 0 : 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Lastname'),
                  ),
                ),
              ),
            ],
          ),
          Flex(
            direction: isSmall ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isSmall ? 0 : 9,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Street'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                flex: isSmall ? 0 : 3,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('House Number'),
                  ),
                ),
              ),
            ],
          ),
          DebugGridOverlay(
            isGridVisible: true,
            hasOuterColumnSpacing: false,
            color: Colors.blue,
            alpha: 50,
            child: Flex(
              direction: isSmall ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                  flex: isSmall ? 0 : 3,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            constraints.biggest.width.toStringAsFixed(0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // const SizedBox.square(dimension: 16),
                Expanded(
                  flex: isSmall ? 0 : 9,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            constraints.biggest.width.toStringAsFixed(0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Flex(
            direction: isSmall ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isSmall ? 0 : 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('State'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                flex: isSmall ? 0 : 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Country'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
