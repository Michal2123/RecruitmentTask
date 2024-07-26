import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/form_field_section.dart';

import '../../widgets/form_sections/form_floating_action_button_section.dart';

class GroupFormView extends StatefulWidget {
  const GroupFormView({super.key});

  @override
  State<GroupFormView> createState() => _NewGroupFormViewState();
}

class _NewGroupFormViewState extends State<GroupFormView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatinActionButtonFormSection(
        formKey: formKey,
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormFieldSection(
                title: 'Group name',
                hintText: 'Enter group name',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
