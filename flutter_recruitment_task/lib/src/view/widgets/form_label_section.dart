import 'package:flutter/material.dart';

class FormLabelSection extends StatelessWidget {
  const FormLabelSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24),
    );
  }
}
