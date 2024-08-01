import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/block/group_bloc.dart';
import 'package:flutter_recruitment_task/src/view/group_list/group_view/group_form_view/group_form_view_section/floatin_action_button_section.dart';
import 'package:flutter_recruitment_task/src/helpers/form_field_validation_mixin.dart';
import 'package:flutter_recruitment_task/src/view/widgets/checkbox_form_field.dart';
import 'package:flutter_recruitment_task/src/view/widgets/form_field_section.dart';

import '../../../../utils/enums.dart';

class GroupFormView extends StatefulWidget {
  const GroupFormView({super.key});
  static const routeName = '/groupFormView';
  @override
  State<GroupFormView> createState() => _NewGroupFormViewState();
}

class _NewGroupFormViewState extends State<GroupFormView>
    with FormFielValidation {
  final checkboxFormFielKey = const ValueKey('checkboxKey');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GroupFloatinActionButtonFormSection(
        formKey: formKey,
      ),
      appBar: AppBar(),
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) => SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 65),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormFieldSection(
                    title: 'Group name',
                    initialValue: state.group?.groupName ?? '',
                    hintText: 'Enter group name',
                    onSave: (value) => context
                        .read<GroupBloc>()
                        .saveFormData({GroupFieldName.groupName.name: value}),
                    validator: (value) => simpleFieldValidation(value),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CheckboxFormField(
                      key: checkboxFormFielKey,
                      initialValue: state.checkList,
                      onChange: (item) => context.read<GroupBloc>()
                        ..add(GroupMemberUpdate(groupMember: item)),
                      validator: (value) => checkboxListFieldValidation(value),
                      items: state.groupMembers,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
