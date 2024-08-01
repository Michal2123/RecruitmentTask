import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/person_list/block/person_block.dart';
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
    return BlocConsumer<PersonBloc, PersonState>(
      listener: (context, state) {
        if (state.status == PersonStatus.succes) {
          context.read<GroupBloc>().add(GroupPersonEdit(person: state.person));
          Navigator.pop(context);
        } else if (state.status == PersonStatus.error) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something went wrong :(')));
        }
      },
      builder: (context, state) => FloatingActionButton(
          onPressed: () => {
                FocusManager.instance.primaryFocus!.unfocus(),
                if (widget.formKey.currentState!.validate())
                  {
                    widget.formKey.currentState!.save(),
                    context.read<PersonBloc>()..add(PersonSave()),
                  }
              },
          child: const Text(
            'Save',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
