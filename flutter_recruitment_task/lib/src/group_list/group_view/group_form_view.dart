import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/checkbox_form_field.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormFieldSection(
                title: 'Group name',
                hintText: 'Enter group name',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CheckboxFormField(
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        !value.any((element) => element)) {
                      return 'Check any persun';
                    }
                    return null;
                  },
                  items: const {'Person1': false, 'Person2': true},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
