import 'package:flutter/material.dart';

class AddressFormWithFlexSimple extends StatelessWidget {
  const AddressFormWithFlexSimple({super.key});

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
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Firstname'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Lastname'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Street'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('House Number'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Zip'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('City'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('State'),
                  ),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Expanded(
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
