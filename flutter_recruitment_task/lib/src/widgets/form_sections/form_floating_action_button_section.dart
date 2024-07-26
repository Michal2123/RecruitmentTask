import 'package:flutter/material.dart';

class FloatinActionButtonFormSection extends StatefulWidget {
  const FloatinActionButtonFormSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<FloatinActionButtonFormSection> createState() =>
      _FloatinActionButtonFormSectionState();
}

class _FloatinActionButtonFormSectionState
    extends State<FloatinActionButtonFormSection> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => {
              FocusManager.instance.primaryFocus!.unfocus(),
              widget.formKey.currentState?.validate()
            },
        child: const Text(
          'Save',
          style: TextStyle(fontSize: 20),
        ));
  }
}
