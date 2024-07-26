import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/form_floating_action_button_section.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/form_field_section.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class PersonFormView extends StatefulWidget {
  const PersonFormView({super.key});

  @override
  State<PersonFormView> createState() => _PersonFormViewState();
}

class _PersonFormViewState extends State<PersonFormView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatinActionButtonFormSection(
        formKey: formKey,
      ),
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: const Column(
              children: [
                FormFieldSection(
                  title: 'Firstname',
                  hintText: 'Firstname',
                ),
                FormFieldSection(
                  title: 'Lastname',
                  hintText: 'Lastname',
                ),
                FormFieldSection(
                  title: 'Birthdate',
                  hintText: 'dd/mm/yyyy',
                  inputFormat: InputFormatters.birthDate,
                ),
                FormFieldSection(
                  title: 'Zip code',
                  hintText: '00-000',
                  inputFormat: InputFormatters.zipCode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
