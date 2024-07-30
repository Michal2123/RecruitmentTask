import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class GroupFloatinActionButtonFormSection extends StatefulWidget {
  const GroupFloatinActionButtonFormSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<GroupFloatinActionButtonFormSection> createState() =>
      _FloatinActionButtonFormSectionState();
}

class _FloatinActionButtonFormSectionState
    extends State<GroupFloatinActionButtonFormSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) => FloatingActionButton(
          onPressed: () => {
                FocusManager.instance.primaryFocus!.unfocus(),
                if (widget.formKey.currentState!.validate())
                  {
                    widget.formKey.currentState!.save(),
                    //context.read<PersonBloc>()..add(PersonSave()),
                    if (state.status == GroupStatus.succes)
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