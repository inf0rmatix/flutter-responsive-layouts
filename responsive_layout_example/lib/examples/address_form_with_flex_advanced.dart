import 'package:flutter/material.dart';

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
          Flex(
            direction: isSmall ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isSmall ? 0 : 3,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Zip'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                flex: isSmall ? 0 : 9,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('City'),
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
