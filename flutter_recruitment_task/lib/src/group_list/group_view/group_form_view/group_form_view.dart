import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/group_list/group_view/group_form_view/group_form_view_section/floatin_action_button_section.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/checkbox_form_field.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/form_field_section.dart';

import '../../../utils/enums.dart';

class GroupFormView extends StatefulWidget {
  const GroupFormView({super.key});
  static const routeName = '/groupFormView';
  @override
  State<GroupFormView> createState() => _NewGroupFormViewState();
}

class _NewGroupFormViewState extends State<GroupFormView> {
  final checkboxFormFielKey = const ValueKey('checkboxKey');
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<GroupBloc>().add(GroupFormCreate());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GroupFloatinActionButtonFormSection(
        formKey: formKey,
      ),
      appBar: AppBar(),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state.status == GroupStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormFieldSection(
                  title: 'Group name',
                  fieldName: 'groupName',
                  initialValue: state.group?.groupName ?? '',
                  hintText: 'Enter group name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CheckboxFormField(
                    key: checkboxFormFielKey,
                    onChange: (value, id, firstName) =>
                        context.read<GroupBloc>()
                          ..add(GroupMemberUpdate(
                              id: id,
                              firstName: firstName,
                              value: value ?? false)),
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          !value.any((element) => element != null && element)) {
                        return 'Check any person';
                      }
                      return null;
                    },
                    items: state.groupMembers,
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
