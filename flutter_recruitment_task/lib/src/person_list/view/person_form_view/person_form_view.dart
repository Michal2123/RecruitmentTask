import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
import 'package:flutter_recruitment_task/src/person_list/view/person_form_view/person_form_view_section/floating_action_button_section.dart';
import 'package:flutter_recruitment_task/src/widgets/form_sections/form_field_section.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

class PersonFormView extends StatefulWidget {
  const PersonFormView({super.key});
  static const routeName = '/personFormView';
  @override
  State<PersonFormView> createState() => _PersonFormViewState();
}

class _PersonFormViewState extends State<PersonFormView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PersonFloatinActionButtonFormSection(
        formKey: formKey,
      ),
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: BlocBuilder<PersonBloc, PersonState>(
              builder: (context, state) => Form(
                    key: formKey,
                    child: Column(
                      children: [
                        FormFieldSection(
                          title: 'Firstname',
                          hintText: 'Firstname',
                          initialValue: state.person?.firstName ?? '',
                          fieldName: PersonFieldName.firstName.name,
                        ),
                        FormFieldSection(
                          title: 'Lastname',
                          hintText: 'Lastname',
                          initialValue: state.person?.lastName ?? '',
                          fieldName: PersonFieldName.lastName.name,
                        ),
                        FormFieldSection(
                          title: 'Birthdate',
                          hintText: 'dd/mm/yyyy',
                          initialValue: state.person?.birthDate ?? '',
                          inputFormat: InputFormatters.birthDate,
                          fieldName: PersonFieldName.birthDate.name,
                        ),
                        FormFieldSection(
                          title: 'Zip code',
                          hintText: '00-000',
                          initialValue: state.person?.zipCode ?? '',
                          inputFormat: InputFormatters.zipCode,
                          fieldName: PersonFieldName.zipCode.name,
                        ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
