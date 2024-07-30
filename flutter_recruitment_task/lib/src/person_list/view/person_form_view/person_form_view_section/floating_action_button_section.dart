import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class PersonFloatinActionButtonFormSection extends StatefulWidget {
  const PersonFloatinActionButtonFormSection(
      {super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<PersonFloatinActionButtonFormSection> createState() =>
      _FloatinActionButtonFormSectionState();
}

class _FloatinActionButtonFormSectionState
    extends State<PersonFloatinActionButtonFormSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) => FloatingActionButton(
          onPressed: () => {
                FocusManager.instance.primaryFocus!.unfocus(),
                if (widget.formKey.currentState!.validate())
                  {
                    widget.formKey.currentState!.save(),
                    context.read<PersonBloc>()..add(PersonSave()),
                    if (state.status == PersonStatus.succes)
                      {Navigator.pop(context)}
                  }
              },
          child: const Text(
            'Save',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
