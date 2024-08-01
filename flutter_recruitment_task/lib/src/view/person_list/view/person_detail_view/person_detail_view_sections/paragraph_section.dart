import 'package:flutter/material.dart';

class ParagraphSection extends StatelessWidget {
  const ParagraphSection({super.key, required this.elements});
  final List<Widget> elements;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: elements,
      ),
    );
  }
}
