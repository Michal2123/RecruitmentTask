import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/form_label_section.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormFieldSection extends StatefulWidget {
  const FormFieldSection(
      {super.key,
      required this.title,
      required this.hintText,
      this.inputFormat = InputFormatters.none});
  final String title;
  final String hintText;
  final InputFormatters inputFormat;

  @override
  State<FormFieldSection> createState() => _FormFieldSectionState();
}

class _FormFieldSectionState extends State<FormFieldSection> {
  final controller = TextEditingController();
  final _birthDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  final _zipCode =
      MaskTextInputFormatter(mask: '##-###', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormLabelSection(
            title: widget.title,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(hintText: widget.hintText),
              inputFormatters: switch (widget.inputFormat) {
                InputFormatters.zipCode => [_zipCode],
                InputFormatters.birthDate => [_birthDate],
                InputFormatters.none => null
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Wypełnij pole';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
