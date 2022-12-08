import 'package:flutter/material.dart';

class AddressFormWithWrap extends StatelessWidget {
  const AddressFormWithWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text('Title'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('Salutation'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('Firstname'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('Lastname'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('Street'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('House Number'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('Zip'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('City'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('State'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text('Country'),
          ),
        ),
      ],
    );
  }
}
