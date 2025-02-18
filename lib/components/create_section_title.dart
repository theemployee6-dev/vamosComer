import 'package:flutter/material.dart';

class CreateSectionTitle extends StatelessWidget {
  const CreateSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
