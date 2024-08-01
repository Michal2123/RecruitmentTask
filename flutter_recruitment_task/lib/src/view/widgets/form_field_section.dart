import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/view/widgets/form_label_section.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormFieldSection extends StatefulWidget {
  const FormFieldSection({
    super.key,
    required this.title,
    required this.hintText,
    required this.initialValue,
    required this.onSave,
    required this.validator,
    this.inputFormat = InputFormatters.none,
  });
  final String title;
  final String hintText;
  final String? initialValue;
  final InputFormatters inputFormat;
  final Function(String?) onSave;
  final Function(String?) validator;

  @override
  State<FormFieldSection> createState() => _FormFieldSectionState();
}

class _FormFieldSectionState extends State<FormFieldSection> {
  final controller = TextEditingController();
  final _birthDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  final _zipCode =
      MaskTextInputFormatter(mask: '##-###', filter: {"#": RegExp(r'[0-9]')});
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    controller.text = widget.initialValue ?? '';
    _focusNode.addListener(focusHandler);
    super.initState();
  }

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
              focusNode: _focusNode,
              controller: controller,
              decoration: InputDecoration(hintText: widget.hintText),
              inputFormatters: switch (widget.inputFormat) {
                InputFormatters.zipCode => [_zipCode],
                InputFormatters.birthDate => [_birthDate],
                InputFormatters.none => null
              },
              onSaved: (newValue) => widget.onSave(newValue),
              validator: (value) => widget.validator(value),
            ),
          )
        ],
      ),
    );
  }

  void focusHandler() {
    if (!_focusNode.hasFocus) {
      _focusNode.unfocus();

      controller.value = TextEditingValue(
          text: context
              .read<PersonBloc>()
              .textFormFielCheck(controller.text, widget.inputFormat));
    }
  }
}
