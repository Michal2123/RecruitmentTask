import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/person_list/block/person_block.dart';
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
    return BlocConsumer<GroupBloc, GroupState>(
      listener: (context, state) {
        if (state.status == GroupStatus.succes) {
          context.read<PersonBloc>().add(PersonGroupEdit(group: state.group));
          Navigator.pop(context);
        } else if (state.status == GroupStatus.error) {
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
                    context.read<GroupBloc>()..add(GroupSave()),
                  }
              },
          child: const Text(
            'Save',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
